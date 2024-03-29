/*
 * Based on arch/arm/mm/mmu.c
 *
 * Copyright (C) 1995-2005 Russell King
 * Copyright (C) 2012 ARM Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <linux/cache.h>
#include <linux/export.h>
#include <linux/kernel.h>
#include <linux/errno.h>
#include <linux/init.h>
#include <linux/ioport.h>
#include <linux/kexec.h>
#include <linux/libfdt.h>
#include <linux/mman.h>
#include <linux/nodemask.h>
#include <linux/memblock.h>
#include <linux/fs.h>
#include <linux/io.h>
#include <linux/mm.h>
#include <linux/vmalloc.h>

#include <asm/barrier.h>
#include <asm/cputype.h>
#include <asm/fixmap.h>
#include <asm/kasan.h>
#include <asm/kernel-pgtable.h>
#include <asm/sections.h>
#include <asm/setup.h>
#include <asm/sizes.h>
#include <asm/tlb.h>
#include <asm/memblock.h>
#include <asm/mmu_context.h>
#include <asm/ptdump.h>
#include <asm/tlbflush.h>

#define NO_BLOCK_MAPPINGS	BIT(0)
#define NO_CONT_MAPPINGS	BIT(1)

u64 idmap_t0sz = TCR_T0SZ(VA_BITS);
u64 idmap_ptrs_per_pgd = PTRS_PER_PGD;
u64 vabits_user __ro_after_init;
EXPORT_SYMBOL(vabits_user);

u64 kimage_voffset __ro_after_init;
EXPORT_SYMBOL(kimage_voffset);

/*
 * Empty_zero_page is a special page that is used for zero-initialized data
 * and COW.
 */
unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
EXPORT_SYMBOL(empty_zero_page);

static pte_t bm_pte[PTRS_PER_PTE] __page_aligned_bss;
static pmd_t bm_pmd[PTRS_PER_PMD] __page_aligned_bss __maybe_unused;
static pud_t bm_pud[PTRS_PER_PUD] __page_aligned_bss __maybe_unused;

static DEFINE_SPINLOCK(swapper_pgdir_lock);
static int flag = 0;
void start_print(int a)
{
	flag = a;
}
int is_print(void)
{
	return flag;
}

void set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
{
	pgd_t *fixmap_pgdp;

	spin_lock(&swapper_pgdir_lock);
	fixmap_pgdp = pgd_set_fixmap(__pa_symbol(pgdp));
	WRITE_ONCE(*fixmap_pgdp, pgd);
	/*
	 * We need dsb(ishst) here to ensure the page-table-walker sees
	 * our new entry before set_p?d() returns. The fixmap's
	 * flush_tlb_kernel_range() via clear_fixmap() does this for us.
	 */
	pgd_clear_fixmap();
	spin_unlock(&swapper_pgdir_lock);
}

pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
			      unsigned long size, pgprot_t vma_prot)
{
	if (!pfn_valid(pfn))
		return pgprot_noncached(vma_prot);
	else if (file->f_flags & O_SYNC)
		return pgprot_writecombine(vma_prot);
	return vma_prot;
}
EXPORT_SYMBOL(phys_mem_access_prot);

static phys_addr_t __init early_pgtable_alloc(void)
{
	phys_addr_t phys;
	void *ptr;

	phys = memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);

	/*
	 * The FIX_{PGD,PUD,PMD} slots may be in active use, but the FIX_PTE
	 * slot will be free, so we can (ab)use the FIX_PTE slot to initialise
	 * any level of table.
	 */
	ptr = pte_set_fixmap(phys);

	memset(ptr, 0, PAGE_SIZE);

	/*
	 * Implicit barriers also ensure the zeroed page is visible to the page
	 * table walker
	 */
	pte_clear_fixmap();
	return phys;
}

static bool pgattr_change_is_safe(u64 old, u64 new)
{
	/*
	 * The following mapping attributes may be updated in live
	 * kernel mappings without the need for break-before-make.
	 */
	static const pteval_t mask = PTE_PXN | PTE_RDONLY | PTE_WRITE | PTE_NG;

	/* creating or taking down mappings is always safe */
	if (old == 0 || new == 0)
		return true;

	/* live contiguous mappings may not be manipulated at all */
	if ((old | new) & PTE_CONT)
		return false;

	/* Transitioning from Non-Global to Global is unsafe */
	if (old & ~new & PTE_NG)
		return false;

	return ((old ^ new) & ~mask) == 0;
}
static int aaaa = 1;
static void init_pte(pmd_t *pmdp, unsigned long addr, unsigned long end,
		     phys_addr_t phys, pgprot_t prot)
{
	pte_t *ptep;

	ptep = pte_set_fixmap_offset(pmdp, addr);
	
	do {
		pte_t old_pte = READ_ONCE(*ptep);

		if(aaaa && is_print())
			pr_err("%s ptep 0x%llx old_pte %llx phys %llx prot %llx\n",__func__,(u64)ptep,old_pte.pte,phys,pgprot_val(prot));
		set_pte(ptep, pfn_pte(__phys_to_pfn(phys), prot));

		/*
		 * After the PTE entry has been populated once, we
		 * only allow updates to the permission attributes.
		 */
		BUG_ON(!pgattr_change_is_safe(pte_val(old_pte),
					      READ_ONCE(pte_val(*ptep))));

		phys += PAGE_SIZE;
	} while (ptep++, addr += PAGE_SIZE, addr != end);
aaaa = 0;
	pte_clear_fixmap();
}

static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
				unsigned long end, phys_addr_t phys,
				pgprot_t prot,
				phys_addr_t (*pgtable_alloc)(void),
				int flags)
{
	unsigned long next;
	pmd_t pmd = READ_ONCE(*pmdp);

	BUG_ON(pmd_sect(pmd));
	if (pmd_none(pmd)) {
		phys_addr_t pte_phys;
		BUG_ON(!pgtable_alloc);
		pte_phys = pgtable_alloc();
		__pmd_populate(pmdp, pte_phys, PMD_TYPE_TABLE);
		pmd = READ_ONCE(*pmdp);
	}
	BUG_ON(pmd_bad(pmd));
	do {
		pgprot_t __prot = prot;

		next = pte_cont_addr_end(addr, end);
		
		/* use a contiguous mapping if the range is suitably aligned */
		if ((((addr | next | phys) & ~CONT_PTE_MASK) == 0) &&
		    (flags & NO_CONT_MAPPINGS) == 0)
			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);
		if(is_print())
			pr_err("%s pmdp 0x%llx addr %lx next %lx phys %llx prot %llx\n",__func__,(u64)pmdp,addr,next,phys,pgprot_val(__prot));
		init_pte(pmdp, addr, next, phys, __prot);

		phys += next - addr;
	} while (addr = next, addr != end);
}

static void init_pmd(pud_t *pudp, unsigned long addr, unsigned long end,
		     phys_addr_t phys, pgprot_t prot,
		     phys_addr_t (*pgtable_alloc)(void), int flags)
{
	unsigned long next;
	pmd_t *pmdp;
	if(is_print())
		pr_err("%s addr 0x%llx,end 0x%llx\n",__func__,(u64)addr,(u64)end);
	pmdp = pmd_set_fixmap_offset(pudp, addr);
	if(is_print())
		pr_err("%s pmdp 0x%llx\n",__func__,(u64)pmdp);
	do {
		pmd_t old_pmd = READ_ONCE(*pmdp);
		next = pmd_addr_end(addr, end);
		if(is_print())
			pr_err("%s addr 0x%lx next 0x%lx phys 0x%llx flags 0x%x\n",__func__,addr,next,(u64)phys,flags);
		/* try section mapping first */
		if (((addr | next | phys) & ~SECTION_MASK) == 0 &&
		    (flags & NO_BLOCK_MAPPINGS) == 0) {
			pmd_set_huge(pmdp, phys, prot);
			/*
			 * After the PMD entry has been populated once, we
			 * only allow updates to the permission attributes.
			 */
			BUG_ON(!pgattr_change_is_safe(pmd_val(old_pmd),
						      READ_ONCE(pmd_val(*pmdp))));
		} else {
			alloc_init_cont_pte(pmdp, addr, next, phys, prot,
					    pgtable_alloc, flags);

			BUG_ON(pmd_val(old_pmd) != 0 &&
			       pmd_val(old_pmd) != READ_ONCE(pmd_val(*pmdp)));
		}
		phys += next - addr;
	} while (pmdp++, addr = next, addr != end);

	pmd_clear_fixmap();
}

static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
				unsigned long end, phys_addr_t phys,
				pgprot_t prot,
				phys_addr_t (*pgtable_alloc)(void), int flags)
{
	unsigned long next;
	pud_t pud = READ_ONCE(*pudp);

	/*
	 * Check for initial section mappings in the pgd/pud.
	 */
	BUG_ON(pud_sect(pud));
	if (pud_none(pud)) {
		phys_addr_t pmd_phys;
		BUG_ON(!pgtable_alloc);
		pmd_phys = pgtable_alloc();
		__pud_populate(pudp, pmd_phys, PUD_TYPE_TABLE);
		pud = READ_ONCE(*pudp);
	}
	BUG_ON(pud_bad(pud));
	if(is_print())
		pr_err("%s pudp 0x%llx,pud 0x%llx\n",__func__,(u64)pudp,pud.pud);
	do {
		pgprot_t __prot = prot;

		next = pmd_cont_addr_end(addr, end);
		if(is_print())
			pr_err("%s addr 0x%lx next 0x%lx phys 0x%llx flags 0x%x\n",__func__,addr,next,(u64)phys,flags);
		/* use a contiguous mapping if the range is suitably aligned */
		if ((((addr | next | phys) & ~CONT_PMD_MASK) == 0) &&
		    (flags & NO_CONT_MAPPINGS) == 0)
			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);

		init_pmd(pudp, addr, next, phys, __prot, pgtable_alloc, flags);

		phys += next - addr;
	} while (addr = next, addr != end);
}

static inline bool use_1G_block(unsigned long addr, unsigned long next,
			unsigned long phys)
{
	if (PAGE_SHIFT != 12)
		return false;

	if (((addr | next | phys) & ~PUD_MASK) != 0)
		return false;

	return true;
}

static void alloc_init_pud(pgd_t *pgdp, unsigned long addr, unsigned long end,
			   phys_addr_t phys, pgprot_t prot,
			   phys_addr_t (*pgtable_alloc)(void),
			   int flags)
{
	unsigned long next;
	pud_t *pudp;
	pgd_t pgd = READ_ONCE(*pgdp);

	if (pgd_none(pgd)) {
		phys_addr_t pud_phys;
		BUG_ON(!pgtable_alloc);
		pud_phys = pgtable_alloc();
		__pgd_populate(pgdp, pud_phys, PUD_TYPE_TABLE);
		pgd = READ_ONCE(*pgdp);
	}
	BUG_ON(pgd_bad(pgd));

	pudp = pud_set_fixmap_offset(pgdp, addr);
	if(is_print())
		pr_err("%s pgd 0x%llx,pudp 0x%llx,0x%llx\n",__func__,pgd.pgd,(u64)pudp,*(u64*)pudp);
	do {
		pud_t old_pud = READ_ONCE(*pudp);
		next = pud_addr_end(addr, end);
		if(is_print())
pr_err("old_pud 0x%llx,next 0x%lx\n",pud_val(old_pud),next);

		/*
		 * For 4K granule only, attempt to put down a 1GB block
		 */
		if (use_1G_block(addr, next, phys) &&
		    (flags & NO_BLOCK_MAPPINGS) == 0) {
			pud_set_huge(pudp, phys, prot);
			/*
			 * After the PUD entry has been populated once, we
			 * only allow updates to the permission attributes.
			 */
			BUG_ON(!pgattr_change_is_safe(pud_val(old_pud),
						      READ_ONCE(pud_val(*pudp))));
		} else {
			alloc_init_cont_pmd(pudp, addr, next, phys, prot,
					    pgtable_alloc, flags);
			BUG_ON(pud_val(old_pud) != 0 &&
			       pud_val(old_pud) != READ_ONCE(pud_val(*pudp)));
		}
		phys += next - addr;
	} while (pudp++, addr = next, addr != end);

	pud_clear_fixmap();
}

static void __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
				 unsigned long virt, phys_addr_t size,
				 pgprot_t prot,
				 phys_addr_t (*pgtable_alloc)(void),
				 int flags)
{
	unsigned long addr, length, end, next;
	pgd_t *pgdp = pgd_offset_raw(pgdir, virt);

	/*
	 * If the virtual and physical address don't have the same offset
	 * within a page, we cannot map the region as the caller expects.
	 */
	if (WARN_ON((phys ^ virt) & ~PAGE_MASK))
		return;

	phys &= PAGE_MASK;
	addr = virt & PAGE_MASK;
	length = PAGE_ALIGN(size + (virt & ~PAGE_MASK));
	end = addr + length;
	//if(is_print())
	pr_err("%s pgdp 0x%llx,phys 0x%llx addr 0x%llx length 0x%llx end 0x%llx\n",__func__,(u64)pgdp,(u64)phys,(u64)addr,(u64)length,(u64)end);

	do {
		
		next = pgd_addr_end(addr, end);
		if(is_print())
			pr_err("%s next 0x%lx\n",__func__,next);
		alloc_init_pud(pgdp, addr, next, phys, prot, pgtable_alloc,
			       flags);
		phys += next - addr;
	} while (pgdp++, addr = next, addr != end);
}

static phys_addr_t pgd_pgtable_alloc(void)
{
	void *ptr = (void *)__get_free_page(PGALLOC_GFP);
	if (!ptr || !pgtable_page_ctor(virt_to_page(ptr)))
		BUG();

	/* Ensure the zeroed page is visible to the page table walker */
	dsb(ishst);
	return __pa(ptr);
}

/*
 * This function can only be used to modify existing table entries,
 * without allocating new levels of table. Note that this permits the
 * creation of new section or page entries.
 */
static void __init create_mapping_noalloc(phys_addr_t phys, unsigned long virt,
				  phys_addr_t size, pgprot_t prot)
{
	if (virt < VMALLOC_START) {
		pr_warn("BUG: not creating mapping for %pa at 0x%016lx - outside kernel range\n",
			&phys, virt);
		return;
	}
	__create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL,
			     NO_CONT_MAPPINGS);
}

void __init create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
			       unsigned long virt, phys_addr_t size,
			       pgprot_t prot, bool page_mappings_only)
{
	int flags = 0;

	BUG_ON(mm == &init_mm);

	if (page_mappings_only)
		flags = NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;

	__create_pgd_mapping(mm->pgd, phys, virt, size, prot,
			     pgd_pgtable_alloc, flags);
}

static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
				phys_addr_t size, pgprot_t prot)
{
	if (virt < VMALLOC_START) {
		pr_warn("BUG: not updating mapping for %pa at 0x%016lx - outside kernel range\n",
			&phys, virt);
		return;
	}

	__create_pgd_mapping(init_mm.pgd, phys, virt, size, prot, NULL,
			     NO_CONT_MAPPINGS);

	/* flush the TLBs after updating live kernel mappings */
	flush_tlb_kernel_range(virt, virt + size);
}

static void __init __map_memblock(pgd_t *pgdp, phys_addr_t start,
				  phys_addr_t end, pgprot_t prot, int flags)
{
	__create_pgd_mapping(pgdp, start, __phys_to_virt(start), end - start,
			     prot, early_pgtable_alloc, flags);
}

void __init mark_linear_text_alias_ro(void)
{
	/*
	 * Remove the write permissions from the linear alias of .text/.rodata
	 */
	update_mapping_prot(__pa_symbol(_text), (unsigned long)lm_alias(_text),
			    (unsigned long)__init_begin - (unsigned long)_text,
			    PAGE_KERNEL_RO);
}

static void __init map_mem(pgd_t *pgdp)
{
	phys_addr_t kernel_start = __pa_symbol(_text);
	phys_addr_t kernel_end = __pa_symbol(__init_begin);
	struct memblock_region *reg;
	int flags = 0;

	if (rodata_full || debug_pagealloc_enabled())
		flags = NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;

	/*
	 * Take care not to create a writable alias for the
	 * read-only text and rodata sections of the kernel image.
	 * So temporarily mark them as NOMAP to skip mappings in
	 * the following for-loop
	 */
	memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
#ifdef CONFIG_KEXEC_CORE
	if (crashk_res.end)
		memblock_mark_nomap(crashk_res.start,
				    resource_size(&crashk_res));
#endif

	/* map all the memory banks */
	for_each_memblock(memory, reg) {
		phys_addr_t start = reg->base;
		phys_addr_t end = start + reg->size;

		if (start >= end)
			break;
		if (memblock_is_nomap(reg))
			continue;
		pr_err("%s start 0x%llx end 0x%llx",__func__,start,end);
		__map_memblock(pgdp, start, end, PAGE_KERNEL, flags);
	}

	/*
	 * Map the linear alias of the [_text, __init_begin) interval
	 * as non-executable now, and remove the write permission in
	 * mark_linear_text_alias_ro() below (which will be called after
	 * alternative patching has completed). This makes the contents
	 * of the region accessible to subsystems such as hibernate,
	 * but protects it from inadvertent modification or execution.
	 * Note that contiguous mappings cannot be remapped in this way,
	 * so we should avoid them here.
	 */
	__map_memblock(pgdp, kernel_start, kernel_end,
		       PAGE_KERNEL, NO_CONT_MAPPINGS);
	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);

#ifdef CONFIG_KEXEC_CORE
	/*
	 * Use page-level mappings here so that we can shrink the region
	 * in page granularity and put back unused memory to buddy system
	 * through /sys/kernel/kexec_crash_size interface.
	 */
	if (crashk_res.end) {
		__map_memblock(pgdp, crashk_res.start, crashk_res.end + 1,
			       PAGE_KERNEL,
			       NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS);
		memblock_clear_nomap(crashk_res.start,
				     resource_size(&crashk_res));
	}
#endif
}

void mark_rodata_ro(void)
{
	unsigned long section_size;

	/*
	 * mark .rodata as read only. Use __init_begin rather than __end_rodata
	 * to cover NOTES and EXCEPTION_TABLE.
	 */
	section_size = (unsigned long)__init_begin - (unsigned long)__start_rodata;
	update_mapping_prot(__pa_symbol(__start_rodata), (unsigned long)__start_rodata,
			    section_size, PAGE_KERNEL_RO);

	debug_checkwx();
}

static void __init map_kernel_segment(pgd_t *pgdp, void *va_start, void *va_end,
				      pgprot_t prot, struct vm_struct *vma,
				      int flags, unsigned long vm_flags)
{
	phys_addr_t pa_start = __pa_symbol(va_start);
	unsigned long size = va_end - va_start;

	BUG_ON(!PAGE_ALIGNED(pa_start));
	BUG_ON(!PAGE_ALIGNED(size));

	__create_pgd_mapping(pgdp, pa_start, (unsigned long)va_start, size, prot,
			     early_pgtable_alloc, flags);

	if (!(vm_flags & VM_NO_GUARD))
		size += PAGE_SIZE;

	vma->addr	= va_start;
	vma->phys_addr	= pa_start;
	vma->size	= size;
	vma->flags	= VM_MAP | vm_flags;
	vma->caller	= __builtin_return_address(0);
	//pr_info("va_start %llx, va_end %llx, pa_start %llx, vma->addr %lx, vma->phys_addr %lx, vma->size %lx",(u64)va_start,(u64)va_end,pa_start,vma->addr,vma->phys_addr,vma->size);
	vm_area_add_early(vma);
}

static int __init parse_rodata(char *arg)
{
	int ret = strtobool(arg, &rodata_enabled);
	if (!ret) {
		rodata_full = false;
		return 0;
	}

	/* permit 'full' in addition to boolean options */
	if (strcmp(arg, "full"))
		return -EINVAL;

	rodata_enabled = true;
	rodata_full = true;
	return 0;
}
early_param("rodata", parse_rodata);

#ifdef CONFIG_UNMAP_KERNEL_AT_EL0
static int __init map_entry_trampoline(void)
{
	pgprot_t prot = rodata_enabled ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
	phys_addr_t pa_start = __pa_symbol(__entry_tramp_text_start);

	/* The trampoline is always mapped and can therefore be global */
	pgprot_val(prot) &= ~PTE_NG;

	/* Map only the text into the trampoline page table */
	memset(tramp_pg_dir, 0, PGD_SIZE);
	__create_pgd_mapping(tramp_pg_dir, pa_start, TRAMP_VALIAS, PAGE_SIZE,
			     prot, pgd_pgtable_alloc, 0);

	/* Map both the text and data into the kernel page table */
	__set_fixmap(FIX_ENTRY_TRAMP_TEXT, pa_start, prot);
	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE)) {
		extern char __entry_tramp_data_start[];

		__set_fixmap(FIX_ENTRY_TRAMP_DATA,
			     __pa_symbol(__entry_tramp_data_start),
			     PAGE_KERNEL_RO);
	}

	return 0;
}
core_initcall(map_entry_trampoline);
#endif

/*
 * Create fine-grained mappings for the kernel.
 */
static void __init map_kernel(pgd_t *pgdp)
{
	static struct vm_struct vmlinux_text, vmlinux_rodata, vmlinux_inittext,
				vmlinux_initdata, vmlinux_data;

	/*
	 * External debuggers may need to write directly to the text
	 * mapping to install SW breakpoints. Allow this (only) when
	 * explicitly requested with rodata=off.
	 */
	pgprot_t text_prot = rodata_enabled ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;

	/*
	 * Only rodata will be remapped with different permissions later on,
	 * all other segments are allowed to use contiguous mappings.
	 */
	//start_print(1);
	map_kernel_segment(pgdp, _text, _etext, text_prot, &vmlinux_text, 0,
			   VM_NO_GUARD);
	map_kernel_segment(pgdp, __start_rodata, __inittext_begin, PAGE_KERNEL,
			   &vmlinux_rodata, NO_CONT_MAPPINGS, VM_NO_GUARD);
	//start_print(0);
	map_kernel_segment(pgdp, __inittext_begin, __inittext_end, text_prot,
			   &vmlinux_inittext, 0, VM_NO_GUARD);
	map_kernel_segment(pgdp, __initdata_begin, __initdata_end, PAGE_KERNEL,
			   &vmlinux_initdata, 0, VM_NO_GUARD);
	map_kernel_segment(pgdp, _data, _end, PAGE_KERNEL, &vmlinux_data, 0, 0);

	if (!READ_ONCE(pgd_val(*pgd_offset_raw(pgdp, FIXADDR_START)))) {
		/*
		 * The fixmap falls in a separate pgd to the kernel, and doesn't
		 * live in the carveout for the swapper_pg_dir. We can simply
		 * re-use the existing dir for the fixmap.
		 */
		set_pgd(pgd_offset_raw(pgdp, FIXADDR_START),
			READ_ONCE(*pgd_offset_k(FIXADDR_START)));
	} else if (CONFIG_PGTABLE_LEVELS > 3) {
		/*
		 * The fixmap shares its top level pgd entry with the kernel
		 * mapping. This can really only occur when we are running
		 * with 16k/4 levels, so we can simply reuse the pud level
		 * entry instead.
		 */
		BUG_ON(!IS_ENABLED(CONFIG_ARM64_16K_PAGES));
		pud_populate(&init_mm,
			     pud_set_fixmap_offset(pgdp, FIXADDR_START),
			     lm_alias(bm_pmd));
		pud_clear_fixmap();
	} else {
		BUG();
	}

	kasan_copy_shadow(pgdp);
}
static void print_pte(void)
{
	u64 *pudp, *pmdp,*ptep;
	u64 *vpudp,*vpmdp,*vptep;
	u32 i = 0,j=0,k=0;
	pudp = (u64*)(*(u64*)swapper_pg_dir);
	pudp = (u64*)(((u64)(pudp)) & PAGE_MASK);
	pr_err("pudp 0x%llx\n",(u64)pudp);
	for(j=0;j<512;j++)
	{
		vpudp = __va(pudp);
		if(*vpudp != 0)
		{
			pmdp = (u64*)(*vpudp);
			pmdp = (u64*)(((u64)(pmdp)) & PAGE_MASK);
			pr_err("vpudp 0x%llx pmdp 0x%llx\n",(u64)vpudp,(u64)pmdp);
			for(k=0;k<512;k++)
			{
				vpmdp = __va(pmdp);
				if(*vpmdp != 0)
				{
					pr_err("             vpmdp 0x%llx ptep 0x%llx\n",(u64)vpmdp,*vpmdp);
					ptep = (u64*)(*vpmdp);
					if(0x03 == (((u64)(ptep)) & 0x03))
					{
						ptep = (u64*)(((u64)(ptep)) & PAGE_MASK);
						for(i=0;i<1;i++)
						{
							vptep = __va(ptep);
							if(*vptep != 0)
							{
								pr_err("                          vptep 0x%llx pte 0x%llx\n",(u64)vptep,*vptep);
							}
							ptep ++;
						}
					}
				}
				pmdp++;
			}

		}
		pudp++;

	}
}
static void print_pgd(void)
{
	u32 i = 0;
	for(i=0;i<512;i++)
	{
		pr_err("swapper_pg_dir index %x %llx\n",i,*((u64*)swapper_pg_dir+i));
	}
}
/*
 * paging_init() sets up the page tables, initialises the zone memory
 * maps and sets up the zero page.
 */
void __init paging_init(void)
{
	pgd_t *pgdp = pgd_set_fixmap(__pa_symbol(swapper_pg_dir));
	pr_err("__pa_symbol(swapper_pg_dir) 0x%llx swapper_pg_dir 0x%llx\n",__pa_symbol(swapper_pg_dir),*(u64*)swapper_pg_dir);
	pr_err("%s pgdp %llx pgdp->pgd %llx\n",__func__,(u64)pgdp,pgdp->pgd);
	map_kernel(pgdp);

	map_mem(pgdp);

	pgd_clear_fixmap();

	cpu_replace_ttbr1(lm_alias(swapper_pg_dir));
	init_mm.pgd = swapper_pg_dir;
	memblock_free(__pa_symbol(init_pg_dir),
		      __pa_symbol(init_pg_end) - __pa_symbol(init_pg_dir));

	memblock_allow_resize();
}

/*
 * Check whether a kernel address is valid (derived from arch/x86/).
 */
int kern_addr_valid(unsigned long addr)
{
	pgd_t *pgdp;
	pud_t *pudp, pud;
	pmd_t *pmdp, pmd;
	pte_t *ptep, pte;

	if ((((long)addr) >> VA_BITS) != -1UL)
		return 0;

	pgdp = pgd_offset_k(addr);
	if (pgd_none(READ_ONCE(*pgdp)))
		return 0;

	pudp = pud_offset(pgdp, addr);
	pud = READ_ONCE(*pudp);
	if (pud_none(pud))
		return 0;

	if (pud_sect(pud))
		return pfn_valid(pud_pfn(pud));

	pmdp = pmd_offset(pudp, addr);
	pmd = READ_ONCE(*pmdp);
	if (pmd_none(pmd))
		return 0;

	if (pmd_sect(pmd))
		return pfn_valid(pmd_pfn(pmd));

	ptep = pte_offset_kernel(pmdp, addr);
	pte = READ_ONCE(*ptep);
	if (pte_none(pte))
		return 0;

	return pfn_valid(pte_pfn(pte));
}
#ifdef CONFIG_SPARSEMEM_VMEMMAP
#if !ARM64_SWAPPER_USES_SECTION_MAPS
int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
		struct vmem_altmap *altmap)
{
	return vmemmap_populate_basepages(start, end, node);
}
#else	/* !ARM64_SWAPPER_USES_SECTION_MAPS */
int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
		struct vmem_altmap *altmap)
{
	unsigned long addr = start;
	unsigned long next;
	pgd_t *pgdp;
	pud_t *pudp;
	pmd_t *pmdp;

	do {
		next = pmd_addr_end(addr, end);

		pgdp = vmemmap_pgd_populate(addr, node);
		if (!pgdp)
			return -ENOMEM;

		pudp = vmemmap_pud_populate(pgdp, addr, node);
		if (!pudp)
			return -ENOMEM;

		pmdp = pmd_offset(pudp, addr);
		if (pmd_none(READ_ONCE(*pmdp))) {
			void *p = NULL;

			p = vmemmap_alloc_block_buf(PMD_SIZE, node);
			if (!p)
				return -ENOMEM;

			pmd_set_huge(pmdp, __pa(p), __pgprot(PROT_SECT_NORMAL));
		} else
			vmemmap_verify((pte_t *)pmdp, node, addr, next);
	} while (addr = next, addr != end);

	return 0;
}
#endif	/* CONFIG_ARM64_64K_PAGES */
void vmemmap_free(unsigned long start, unsigned long end,
		struct vmem_altmap *altmap)
{
}
#endif	/* CONFIG_SPARSEMEM_VMEMMAP */

static inline pud_t * fixmap_pud(unsigned long addr)
{
	pgd_t *pgdp = pgd_offset_k(addr);
	pgd_t pgd = READ_ONCE(*pgdp);

	BUG_ON(pgd_none(pgd) || pgd_bad(pgd));

	return pud_offset_kimg(pgdp, addr);
}

static inline pmd_t * fixmap_pmd(unsigned long addr)
{
	pud_t *pudp = fixmap_pud(addr);
	pud_t pud = READ_ONCE(*pudp);

	BUG_ON(pud_none(pud) || pud_bad(pud));

	return pmd_offset_kimg(pudp, addr);
}

static inline pte_t * fixmap_pte(unsigned long addr)
{
	return &bm_pte[pte_index(addr)];
}

/*
 * The p*d_populate functions call virt_to_phys implicitly so they can't be used
 * directly on kernel symbols (bm_p*d). This function is called too early to use
 * lm_alias so __p*d_populate functions must be used to populate with the
 * physical address from __pa_symbol.
 */
void __init early_fixmap_init(void)
{
	pgd_t *pgdp, pgd;
	pud_t *pudp;
	pmd_t *pmdp;
	unsigned long addr = FIXADDR_START;
	pr_err("kimage_voffset 0x%llx swapper_pg_dir 0x%llx addr 0x%lx,init_mm.pgd 0x%llx\n",kimage_voffset,(u64)swapper_pg_dir,addr,(u64)init_mm.pgd);
	pr_err("bm_pud 0x%llx,bm_pmd 0x%llx,bm_pte 0x%llx\n",(u64)bm_pud,(u64)bm_pmd,(u64)bm_pte);
	pr_err("pa_bm_pud 0x%llx,pa_bm_pmd 0x%llx,pa_bm_pte 0x%llx,pa_init_mm.pgd 0x%llx\n",__pa_symbol(bm_pud),__pa_symbol(bm_pmd),__pa_symbol(bm_pte),__pa_symbol(init_mm.pgd));
/*
[    0.000000] kimage_voffset 0xfffeffffd0000000 swapper_pg_dir 0xffff000011ad6000 addr 0xffff7dfffe7f9000,init_mm.pgd 0xffff0000120f8000
[    0.000000] bm_pud 0xffff000012075000,bm_pmd 0xffff000012074000,bm_pte 0xffff000012073000
[    0.000000] pa_bm_pud 0x42075000,pa_bm_pmd 0x42074000,pa_bm_pte 0x42073000
*/
	pgdp = pgd_offset_k(addr); //0xffff0000120f87d8 
	pr_err("pa_pgdp 0x%llx\n",__pa_symbol(pgdp));
	pgd = READ_ONCE(*pgdp); 
	//pr_err("pgd 0x%llx---------------\n",(u64));
	if (CONFIG_PGTABLE_LEVELS > 3 &&
	    !(pgd_none(pgd) || pgd_page_paddr(pgd) == __pa_symbol(bm_pud))) {
		/*
		 * We only end up here if the kernel mapping and the fixmap
		 * share the top level pgd entry, which should only happen on
		 * 16k/4 levels configurations.
		 */
		BUG_ON(!IS_ENABLED(CONFIG_ARM64_16K_PAGES));
		pudp = pud_offset_kimg(pgdp, addr);
	} else {
		if (pgd_none(pgd))
			__pgd_populate(pgdp, __pa_symbol(bm_pud), PUD_TYPE_TABLE); // bm_pud 0xffff000012075000, __pa_symbol(bm_pud) 0x42075003
		pudp = fixmap_pud(addr); //pudp 0xffff000012075ff8
		
	}
	if (pud_none(READ_ONCE(*pudp)))
		__pud_populate(pudp, __pa_symbol(bm_pmd), PMD_TYPE_TABLE); // bm_pmd 0xffff000012074000, __pa_symbol(bm_pmd) 0x42074003
	pmdp = fixmap_pmd(addr); //pmdp FFFF 0000 1207 4F98
	__pmd_populate(pmdp, __pa_symbol(bm_pte), PMD_TYPE_TABLE); //bm_pmd 0xffff000012073000, __pa_symbol(bm_pmd) 0x42073003
	pr_err("pgdp 0x%llx,pudp 0x%llx,pmdp 0x%llx\n",(u64)pgdp,(u64)pudp,(u64)pmdp);
	pr_err("pgdp->pgd 0x%llx,pudp->pud 0x%llx,pmdp->pmd 0x%llx\n",(u64)pgdp->pgd,(u64)pudp->pud,(u64)pmdp->pmd);
	//pgdp 0xffff0000120f87d8,pudp 0xffff000012075ff8,pmdp 0xffff000012074f98
	//pgdp->pgd 0x42075003,pudp->pud 0x42074003,pmdp->pmd 0x42073003
	/*
	 * The boot-ioremap range spans multiple pmds, for which
	 * we are not prepared:
	 */
	BUILD_BUG_ON((__fix_to_virt(FIX_BTMAP_BEGIN) >> PMD_SHIFT)
		     != (__fix_to_virt(FIX_BTMAP_END) >> PMD_SHIFT));
//0xffff7dfffec00000
	pr_err("fix_to_virt(FIX_BTMAP_BEGIN) 0x%llx , fix_to_virt(FIX_BTMAP_END) 0x%llx\n",(u64)fix_to_virt(FIX_BTMAP_BEGIN),(u64)fix_to_virt(FIX_BTMAP_END));
	if ((pmdp != fixmap_pmd(fix_to_virt(FIX_BTMAP_BEGIN)))
	     || pmdp != fixmap_pmd(fix_to_virt(FIX_BTMAP_END))) {
		WARN_ON(1);
		pr_warn("pmdp %p != %p, %p\n",
			pmdp, fixmap_pmd(fix_to_virt(FIX_BTMAP_BEGIN)), 
			fixmap_pmd(fix_to_virt(FIX_BTMAP_END)));
		pr_warn("fix_to_virt(FIX_BTMAP_BEGIN): %08lx\n",
			fix_to_virt(FIX_BTMAP_BEGIN));
		pr_warn("fix_to_virt(FIX_BTMAP_END):   %08lx\n",
			fix_to_virt(FIX_BTMAP_END));

		pr_warn("FIX_BTMAP_END:       %d\n", FIX_BTMAP_END);
		pr_warn("FIX_BTMAP_BEGIN:     %d\n", FIX_BTMAP_BEGIN);
	}
}

/*
 * Unusually, this is also called in IRQ context (ghes_iounmap_irq) so if we
 * ever need to use IPIs for TLB broadcasting, then we're in trouble here.
 */

void __set_fixmap(enum fixed_addresses idx,
			       phys_addr_t phys, pgprot_t flags)
{
	unsigned long addr = __fix_to_virt(idx);//FFFF 7DFF FE63 7000
	pte_t *ptep;
	if(is_print())
		pr_err("idx %d addr 0x%lx,phys 0x%llx,flags 0x%llx\n",idx,addr,phys,pgprot_val(flags));
	BUG_ON(idx <= FIX_HOLE || idx >= __end_of_fixed_addresses);

	ptep = fixmap_pte(addr);
	if(is_print())
		pr_err("pte 0x%llx\n",(u64)ptep); //0xffff0000120731b8
	if (pgprot_val(flags)) {
		set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
		if(is_print())
			pr_err("pte value 0x%llx\n",ptep->pte); //42075ff8
	} else {
		pte_clear(&init_mm, addr, ptep);
		flush_tlb_kernel_range(addr, addr+PAGE_SIZE);
	}
}

void *__init __fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot)
{
	const u64 dt_virt_base = __fix_to_virt(FIX_FDT);
	int offset;
	void *dt_virt;
	pr_err("dt_virt_base 0x%08llx\n",dt_virt_base); //0xffff7dfffe800000
	/*
	 * Check whether the physical FDT address is set and meets the minimum
	 * alignment requirement. Since we are relying on MIN_FDT_ALIGN to be
	 * at least 8 bytes so that we can always access the magic and size
	 * fields of the FDT header after mapping the first chunk, double check
	 * here if that is indeed the case.
	 */
	BUILD_BUG_ON(MIN_FDT_ALIGN < 8);
	if (!dt_phys || dt_phys % MIN_FDT_ALIGN)
		return NULL;

	/*
	 * Make sure that the FDT region can be mapped without the need to
	 * allocate additional translation table pages, so that it is safe
	 * to call create_mapping_noalloc() this early.
	 *
	 * On 64k pages, the FDT will be mapped using PTEs, so we need to
	 * be in the same PMD as the rest of the fixmap.
	 * On 4k pages, we'll use section mappings for the FDT so we only
	 * have to be in the same PUD.
	 */
	BUILD_BUG_ON(dt_virt_base % SZ_2M);
	pr_err("__fix_to_virt(FIX_FDT_END) 0x%lx __fix_to_virt(FIX_BTMAP_BEGIN) 0x%lx \n",__fix_to_virt(FIX_FDT_END),__fix_to_virt(FIX_BTMAP_BEGIN));
	BUILD_BUG_ON(__fix_to_virt(FIX_FDT_END) >> SWAPPER_TABLE_SHIFT !=
		     __fix_to_virt(FIX_BTMAP_BEGIN) >> SWAPPER_TABLE_SHIFT);

	offset = dt_phys % SWAPPER_BLOCK_SIZE;
	pr_err("offset 0x%08x\n",offset); //0
	dt_virt = (void *)dt_virt_base + offset;
	pr_err("dt_virt 0x%08llx %d\n",(u64)dt_virt,round_up(150,256)); //0xffff7dfffe800000

	/* map the first chunk so we can read the size from the header */
	create_mapping_noalloc(round_down(dt_phys, SWAPPER_BLOCK_SIZE),
			dt_virt_base, SWAPPER_BLOCK_SIZE, prot);

	if (fdt_magic(dt_virt) != FDT_MAGIC)
		return NULL;

	*size = fdt_totalsize(dt_virt);
	pr_err("fdt size 0x%x\n",*size);
	if (*size > MAX_FDT_SIZE)
		return NULL;

	if (offset + *size > SWAPPER_BLOCK_SIZE)
		create_mapping_noalloc(round_down(dt_phys, SWAPPER_BLOCK_SIZE), dt_virt_base,
			       round_up(offset + *size, SWAPPER_BLOCK_SIZE), prot);
	return dt_virt;
}

void *__init fixmap_remap_fdt(phys_addr_t dt_phys)
{
	void *dt_virt;
	int size;
	dt_virt = __fixmap_remap_fdt(dt_phys, &size, PAGE_KERNEL_RO);
	if (!dt_virt)
		return NULL;

	memblock_reserve(dt_phys, size);
	
	return dt_virt;
}

int __init arch_ioremap_pud_supported(void)
{
	/* only 4k granule supports level 1 block mappings */
	return IS_ENABLED(CONFIG_ARM64_4K_PAGES);
}

int __init arch_ioremap_pmd_supported(void)
{
	return 1;
}

int pud_set_huge(pud_t *pudp, phys_addr_t phys, pgprot_t prot)
{
	pgprot_t sect_prot = __pgprot(PUD_TYPE_SECT |
					pgprot_val(mk_sect_prot(prot)));
	pud_t new_pud = pfn_pud(__phys_to_pfn(phys), sect_prot);
	pr_err("%s pudp %llx phys %llx prot %llx\n",__func__,(u64)pudp,phys,pgprot_val(prot));
	/* Only allow permission changes for now */
	if (!pgattr_change_is_safe(READ_ONCE(pud_val(*pudp)),
				   pud_val(new_pud)))
		return 0;

	BUG_ON(phys & ~PUD_MASK);
	set_pud(pudp, new_pud);
	return 1;
}

int pmd_set_huge(pmd_t *pmdp, phys_addr_t phys, pgprot_t prot)
{
	pgprot_t sect_prot = __pgprot(PMD_TYPE_SECT |
					pgprot_val(mk_sect_prot(prot)));
	pmd_t new_pmd = pfn_pmd(__phys_to_pfn(phys), sect_prot);
	//pr_err("%s new_pmd 0x%llx prot 0x%llx\n",__func__,new_pmd.pmd,pgprot_val(sect_prot));
	/* Only allow permission changes for now */
	if (!pgattr_change_is_safe(READ_ONCE(pmd_val(*pmdp)),
				   pmd_val(new_pmd)))
		return 0;

	BUG_ON(phys & ~PMD_MASK);
	set_pmd(pmdp, new_pmd);
	return 1;
}

int pud_clear_huge(pud_t *pudp)
{
	if (!pud_sect(READ_ONCE(*pudp)))
		return 0;
	pud_clear(pudp);
	return 1;
}

int pmd_clear_huge(pmd_t *pmdp)
{
	if (!pmd_sect(READ_ONCE(*pmdp)))
		return 0;
	pmd_clear(pmdp);
	return 1;
}

int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
{
	pte_t *table;
	pmd_t pmd;

	pmd = READ_ONCE(*pmdp);

	if (!pmd_table(pmd)) {
		VM_WARN_ON(1);
		return 1;
	}

	table = pte_offset_kernel(pmdp, addr);
	pmd_clear(pmdp);
	__flush_tlb_kernel_pgtable(addr);
	pte_free_kernel(NULL, table);
	return 1;
}

int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
{
	pmd_t *table;
	pmd_t *pmdp;
	pud_t pud;
	unsigned long next, end;

	pud = READ_ONCE(*pudp);

	if (!pud_table(pud)) {
		VM_WARN_ON(1);
		return 1;
	}

	table = pmd_offset(pudp, addr);
	pmdp = table;
	next = addr;
	end = addr + PUD_SIZE;
	do {
		pmd_free_pte_page(pmdp, next);
	} while (pmdp++, next += PMD_SIZE, next != end);

	pud_clear(pudp);
	__flush_tlb_kernel_pgtable(addr);
	pmd_free(NULL, table);
	return 1;
}

int p4d_free_pud_page(p4d_t *p4d, unsigned long addr)
{
	return 0;	/* Don't attempt a block mapping */
}

#ifdef CONFIG_MEMORY_HOTPLUG
int arch_add_memory(int nid, u64 start, u64 size, struct vmem_altmap *altmap,
		    bool want_memblock)
{
	int flags = 0;

	if (rodata_full || debug_pagealloc_enabled())
		flags = NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;

	__create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
			     size, PAGE_KERNEL, pgd_pgtable_alloc, flags);

	return __add_pages(nid, start >> PAGE_SHIFT, size >> PAGE_SHIFT,
			   altmap, want_memblock);
}
#endif
