	.arch armv8-a
	.file	"bounds.c"
// GNU C89 (Ubuntu/Linaro 8.4.0-1ubuntu1~18.04) version 8.4.0 (aarch64-linux-gnu)
//	compiled by GNU C version 8.4.0, GMP version 6.1.2, MPFR version 4.0.1, MPC version 1.1.0, isl version isl-0.19-GMP

// GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
// options passed:  -nostdinc -I ./arch/arm64/include
// -I ./arch/arm64/include/generated -I ./include
// -I ./arch/arm64/include/uapi -I ./arch/arm64/include/generated/uapi
// -I ./include/uapi -I ./include/generated/uapi
// -imultiarch aarch64-linux-gnu -D __KERNEL__ -D CC_USING_PATCHABLE_FENTRY
// -D KASAN_SHADOW_SCALE_SHIFT=3 -D CONFIG_AS_LSE=1
// -D KASAN_SHADOW_SCALE_SHIFT=3 -D KBUILD_BASENAME="bounds"
// -D KBUILD_MODNAME="bounds"
// -isystem /usr/lib/gcc-cross/aarch64-linux-gnu/8/include
// -include ./include/linux/kconfig.h
// -include ./include/linux/compiler_types.h -MD kernel/.bounds.s.d
// kernel/bounds.c -mlittle-endian -mgeneral-regs-only -mabi=lp64
// -auxbase-strip kernel/bounds.s -g -O0 -Wall -Wundef
// -Werror=strict-prototypes -Wno-trigraphs
// -Werror=implicit-function-declaration -Werror=implicit-int
// -Wno-format-security -Wno-unused-function -Wno-frame-address
// -Wformat-truncation=0 -Wformat-overflow=0 -Wno-int-in-bool-context
// -Wframe-larger-than=4096 -Wno-unused-but-set-variable
// -Wunused-const-variable=0 -Wdeclaration-after-statement -Wvla
// -Wno-pointer-sign -Wno-stringop-truncation -Werror=date-time
// -Werror=incompatible-pointer-types -Werror=designated-init
// -Wno-packed-not-aligned -std=gnu90 -fno-strict-aliasing -fno-common
// -fshort-wchar -fno-PIE -fno-asynchronous-unwind-tables
// -fno-delete-null-pointer-checks -fstack-protector-strong
// -fno-omit-frame-pointer -fno-optimize-sibling-calls
// -fno-var-tracking-assignments -fpatchable-function-entry=2
// -fno-strict-overflow -fno-merge-all-constants -fmerge-constants
// -fstack-check=no -fconserve-stack -fmacro-prefix-map=./= -fverbose-asm
// --param allow-store-data-races=0 -fstack-protector-strong
// options enabled:  -faggressive-loop-optimizations -fauto-inc-dec
// -fchkp-check-incomplete-type -fchkp-check-read -fchkp-check-write
// -fchkp-instrument-calls -fchkp-narrow-bounds -fchkp-optimize
// -fchkp-store-bounds -fchkp-use-static-bounds
// -fchkp-use-static-const-bounds -fchkp-use-wrappers -fdwarf2-cfi-asm
// -fearly-inlining -feliminate-unused-debug-types -ffp-int-builtin-inexact
// -ffunction-cse -fgcse-lm -fgnu-runtime -fgnu-unique -fident
// -finline-atomics -fira-hoist-pressure -fira-share-save-slots
// -fira-share-spill-slots -fivopts -fkeep-static-consts
// -fleading-underscore -flifetime-dse -flto-odr-type-merging -fmath-errno
// -fmerge-constants -fmerge-debug-strings -fomit-frame-pointer -fpeephole
// -fplt -fprefetch-loop-arrays -freg-struct-return
// -fsched-critical-path-heuristic -fsched-dep-count-heuristic
// -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
// -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
// -fsched-stalled-insns-dep -fschedule-fusion -fsemantic-interposition
// -fshow-column -fshrink-wrap-separate -fsigned-zeros
// -fsplit-ivs-in-unroller -fssa-backprop -fstack-protector-strong
// -fstdarg-opt -fstrict-volatile-bitfields -fsync-libcalls -ftrapping-math
// -ftree-cselim -ftree-forwprop -ftree-loop-if-convert -ftree-loop-im
// -ftree-loop-ivcanon -ftree-loop-optimize -ftree-parallelize-loops=
// -ftree-phiprop -ftree-reassoc -ftree-scev-cprop -funit-at-a-time
// -funwind-tables -fverbose-asm -fwrapv -fwrapv-pointer
// -fzero-initialized-in-bss -mfix-cortex-a53-835769
// -mfix-cortex-a53-843419 -mgeneral-regs-only -mglibc -mlittle-endian
// -momit-leaf-frame-pointer -mpc-relative-literal-loads

	.text
.Ltext0:
#APP
	.arch_extension	lse
	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30
	.equ	.L__reg_num_x\num, \num
	.endr
	.equ	.L__reg_num_xzr, 31

	.macro	mrs_s, rt, sreg
.inst (0xd5200000|(\sreg)|(.L__reg_num_\rt))
		.endm

	.macro	msr_s, sreg, rt
.inst (0xd5000000|(\sreg)|(.L__reg_num_\rt))
		.endm

#NO_APP
	.align	2
	.global	main
	.type	main, %function
main:
	.section	__patchable_function_entries,"a",@progbits
	.8byte	.LPFE1
	.text
.LPFE1:
	nop
	nop
.LFB509:
	.file 1 "kernel/bounds.c"
	.loc 1 17 1
	.cfi_startproc
// kernel/bounds.c:19: 	DEFINE(NR_PAGEFLAGS, __NR_PAGEFLAGS);
	.loc 1 19 2
#APP
// 19 "kernel/bounds.c" 1
	
.ascii "->NR_PAGEFLAGS 23 __NR_PAGEFLAGS"	//
// 0 "" 2
// kernel/bounds.c:20: 	DEFINE(MAX_NR_ZONES, __MAX_NR_ZONES);
	.loc 1 20 2
// 20 "kernel/bounds.c" 1
	
.ascii "->MAX_NR_ZONES 3 __MAX_NR_ZONES"	//
// 0 "" 2
// kernel/bounds.c:22: 	DEFINE(NR_CPUS_BITS, ilog2(CONFIG_NR_CPUS));
	.loc 1 22 2
// 22 "kernel/bounds.c" 1
	
.ascii "->NR_CPUS_BITS 8 ilog2(CONFIG_NR_CPUS)"	//
// 0 "" 2
// kernel/bounds.c:24: 	DEFINE(SPINLOCK_SIZE, sizeof(spinlock_t));
	.loc 1 24 2
// 24 "kernel/bounds.c" 1
	
.ascii "->SPINLOCK_SIZE 4 sizeof(spinlock_t)"	//
// 0 "" 2
// kernel/bounds.c:27: 	return 0;
	.loc 1 27 9
#NO_APP
	mov	w0, 0	// _1,
// kernel/bounds.c:28: }
	.loc 1 28 1
	ret	
	.cfi_endproc
.LFE509:
	.size	main, .-main
.Letext0:
	.file 2 "./include/linux/types.h"
	.file 3 "./arch/arm64/include/asm/insn.h"
	.file 4 "./include/linux/init.h"
	.file 5 "./arch/arm64/include/asm/alternative.h"
	.file 6 "./arch/arm64/include/asm/cache.h"
	.file 7 "./include/linux/printk.h"
	.file 8 "./include/linux/kernel.h"
	.file 9 "./include/linux/page-flags.h"
	.file 10 "./include/linux/mmzone.h"
	.file 11 "./include/linux/lockdep.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x506
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF108
	.byte	0x1
	.4byte	.LASF109
	.4byte	.LASF110
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x3
	.4byte	0x34
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x5
	.byte	0x8
	.4byte	0x34
	.uleb128 0x6
	.4byte	.LASF11
	.byte	0x2
	.byte	0x1e
	.byte	0x11
	.4byte	0x91
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF10
	.uleb128 0x7
	.byte	0x4
	.byte	0x2
	.byte	0xb0
	.byte	0x9
	.4byte	0xaf
	.uleb128 0x8
	.4byte	.LASF59
	.byte	0x2
	.byte	0xb1
	.byte	0x6
	.4byte	0x63
	.byte	0
	.byte	0
	.uleb128 0x6
	.4byte	.LASF12
	.byte	0x2
	.byte	0xb2
	.byte	0x3
	.4byte	0x98
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x3
	.2byte	0x1da
	.byte	0xf
	.4byte	0xc8
	.uleb128 0xa
	.4byte	0x85
	.4byte	0xd7
	.uleb128 0xb
	.4byte	0x2d
	.byte	0
	.uleb128 0xc
	.4byte	0xf2
	.4byte	0xe7
	.uleb128 0xd
	.4byte	0x2d
	.byte	0xf
	.byte	0
	.uleb128 0x3
	.4byte	0xd7
	.uleb128 0x5
	.byte	0x8
	.4byte	0xbb
	.uleb128 0x3
	.4byte	0xec
	.uleb128 0xe
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x1db
	.byte	0x1f
	.4byte	0xe7
	.uleb128 0x5
	.byte	0x8
	.4byte	0x10a
	.uleb128 0xf
	.uleb128 0x6
	.4byte	.LASF14
	.byte	0x4
	.byte	0x78
	.byte	0xd
	.4byte	0x63
	.uleb128 0xc
	.4byte	0x10b
	.4byte	0x122
	.uleb128 0x10
	.byte	0
	.uleb128 0x11
	.4byte	.LASF16
	.byte	0x4
	.byte	0x87
	.byte	0x19
	.4byte	0x117
	.uleb128 0x11
	.4byte	.LASF17
	.byte	0x4
	.byte	0x87
	.byte	0x31
	.4byte	0x117
	.uleb128 0xc
	.4byte	0x34
	.4byte	0x145
	.uleb128 0x10
	.byte	0
	.uleb128 0x11
	.4byte	.LASF18
	.byte	0x4
	.byte	0x8e
	.byte	0x18
	.4byte	0x13a
	.uleb128 0x11
	.4byte	.LASF19
	.byte	0x4
	.byte	0x8f
	.byte	0xe
	.4byte	0x7f
	.uleb128 0x11
	.4byte	.LASF20
	.byte	0x4
	.byte	0x90
	.byte	0x15
	.4byte	0x40
	.uleb128 0x11
	.4byte	.LASF21
	.byte	0x4
	.byte	0x98
	.byte	0xd
	.4byte	0x85
	.uleb128 0x11
	.4byte	.LASF22
	.byte	0x4
	.byte	0x9e
	.byte	0xf
	.4byte	0x104
	.uleb128 0x11
	.4byte	.LASF23
	.byte	0x4
	.byte	0xa0
	.byte	0xd
	.4byte	0x85
	.uleb128 0x11
	.4byte	.LASF24
	.byte	0x5
	.byte	0x11
	.byte	0xc
	.4byte	0x63
	.uleb128 0x11
	.4byte	.LASF25
	.byte	0x6
	.byte	0x47
	.byte	0x16
	.4byte	0x2d
	.uleb128 0xc
	.4byte	0x3b
	.4byte	0x1b0
	.uleb128 0x10
	.byte	0
	.uleb128 0x3
	.4byte	0x1a5
	.uleb128 0x11
	.4byte	.LASF26
	.byte	0x7
	.byte	0xb
	.byte	0x13
	.4byte	0x1b0
	.uleb128 0x11
	.4byte	.LASF27
	.byte	0x7
	.byte	0xc
	.byte	0x13
	.4byte	0x1b0
	.uleb128 0xc
	.4byte	0x63
	.4byte	0x1d8
	.uleb128 0x10
	.byte	0
	.uleb128 0x11
	.4byte	.LASF28
	.byte	0x7
	.byte	0x3f
	.byte	0xc
	.4byte	0x1cd
	.uleb128 0x11
	.4byte	.LASF29
	.byte	0x7
	.byte	0x53
	.byte	0xd
	.4byte	0x13a
	.uleb128 0x11
	.4byte	.LASF30
	.byte	0x7
	.byte	0xbb
	.byte	0xc
	.4byte	0x63
	.uleb128 0x11
	.4byte	.LASF31
	.byte	0x7
	.byte	0xbc
	.byte	0xc
	.4byte	0x63
	.uleb128 0xe
	.4byte	.LASF32
	.byte	0x7
	.2byte	0x11c
	.byte	0xc
	.4byte	0x63
	.uleb128 0x12
	.4byte	.LASF34
	.uleb128 0x3
	.4byte	0x215
	.uleb128 0xe
	.4byte	.LASF33
	.byte	0x7
	.2byte	0x1dc
	.byte	0x25
	.4byte	0x21a
	.uleb128 0x12
	.4byte	.LASF35
	.uleb128 0xe
	.4byte	.LASF36
	.byte	0x8
	.2byte	0x144
	.byte	0x24
	.4byte	0x22c
	.uleb128 0xa
	.4byte	0x78
	.4byte	0x24d
	.uleb128 0xb
	.4byte	0x63
	.byte	0
	.uleb128 0xe
	.4byte	.LASF37
	.byte	0x8
	.2byte	0x145
	.byte	0xf
	.4byte	0x25a
	.uleb128 0x5
	.byte	0x8
	.4byte	0x23e
	.uleb128 0xe
	.4byte	.LASF38
	.byte	0x8
	.2byte	0x210
	.byte	0xc
	.4byte	0x63
	.uleb128 0xe
	.4byte	.LASF39
	.byte	0x8
	.2byte	0x211
	.byte	0xc
	.4byte	0x63
	.uleb128 0xe
	.4byte	.LASF40
	.byte	0x8
	.2byte	0x212
	.byte	0x16
	.4byte	0x2d
	.uleb128 0xe
	.4byte	.LASF41
	.byte	0x8
	.2byte	0x213
	.byte	0xc
	.4byte	0x63
	.uleb128 0xe
	.4byte	.LASF42
	.byte	0x8
	.2byte	0x214
	.byte	0xc
	.4byte	0x63
	.uleb128 0xe
	.4byte	.LASF43
	.byte	0x8
	.2byte	0x215
	.byte	0xc
	.4byte	0x63
	.uleb128 0xe
	.4byte	.LASF44
	.byte	0x8
	.2byte	0x216
	.byte	0xc
	.4byte	0x63
	.uleb128 0xe
	.4byte	.LASF45
	.byte	0x8
	.2byte	0x217
	.byte	0xc
	.4byte	0x63
	.uleb128 0xe
	.4byte	.LASF46
	.byte	0x8
	.2byte	0x218
	.byte	0xc
	.4byte	0x63
	.uleb128 0xe
	.4byte	.LASF47
	.byte	0x8
	.2byte	0x21a
	.byte	0xd
	.4byte	0x85
	.uleb128 0xe
	.4byte	.LASF48
	.byte	0x8
	.2byte	0x221
	.byte	0x11
	.4byte	0xaf
	.uleb128 0xe
	.4byte	.LASF49
	.byte	0x8
	.2byte	0x235
	.byte	0xc
	.4byte	0x63
	.uleb128 0xe
	.4byte	.LASF50
	.byte	0x8
	.2byte	0x237
	.byte	0xd
	.4byte	0x85
	.uleb128 0x13
	.4byte	.LASF66
	.byte	0x7
	.byte	0x4
	.4byte	0x40
	.byte	0x8
	.2byte	0x23d
	.byte	0xd
	.4byte	0x347
	.uleb128 0x14
	.4byte	.LASF51
	.byte	0
	.uleb128 0x14
	.4byte	.LASF52
	.byte	0x1
	.uleb128 0x14
	.4byte	.LASF53
	.byte	0x2
	.uleb128 0x14
	.4byte	.LASF54
	.byte	0x3
	.uleb128 0x14
	.4byte	.LASF55
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF56
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF57
	.byte	0x6
	.byte	0
	.uleb128 0xe
	.4byte	.LASF58
	.byte	0x8
	.2byte	0x245
	.byte	0x3
	.4byte	0x309
	.uleb128 0x15
	.4byte	.LASF111
	.byte	0x3
	.byte	0x8
	.2byte	0x25c
	.byte	0x8
	.4byte	0x38d
	.uleb128 0x16
	.4byte	.LASF60
	.byte	0x8
	.2byte	0x25d
	.byte	0x7
	.4byte	0x34
	.byte	0
	.uleb128 0x16
	.4byte	.LASF61
	.byte	0x8
	.2byte	0x25e
	.byte	0x7
	.4byte	0x34
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF62
	.byte	0x8
	.2byte	0x25f
	.byte	0x7
	.4byte	0x85
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.4byte	0x354
	.uleb128 0xc
	.4byte	0x38d
	.4byte	0x3a2
	.uleb128 0xd
	.4byte	0x2d
	.byte	0x11
	.byte	0
	.uleb128 0x3
	.4byte	0x392
	.uleb128 0xe
	.4byte	.LASF63
	.byte	0x8
	.2byte	0x262
	.byte	0x20
	.4byte	0x3a2
	.uleb128 0xe
	.4byte	.LASF64
	.byte	0x8
	.2byte	0x264
	.byte	0x13
	.4byte	0x1b0
	.uleb128 0xe
	.4byte	.LASF65
	.byte	0x8
	.2byte	0x26f
	.byte	0x13
	.4byte	0x1b0
	.uleb128 0x17
	.4byte	.LASF67
	.byte	0x7
	.byte	0x4
	.4byte	0x40
	.byte	0x9
	.byte	0x46
	.byte	0x6
	.4byte	0x4a7
	.uleb128 0x14
	.4byte	.LASF68
	.byte	0
	.uleb128 0x14
	.4byte	.LASF69
	.byte	0x1
	.uleb128 0x14
	.4byte	.LASF70
	.byte	0x2
	.uleb128 0x14
	.4byte	.LASF71
	.byte	0x3
	.uleb128 0x14
	.4byte	.LASF72
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF73
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF74
	.byte	0x6
	.uleb128 0x14
	.4byte	.LASF75
	.byte	0x7
	.uleb128 0x14
	.4byte	.LASF76
	.byte	0x8
	.uleb128 0x14
	.4byte	.LASF77
	.byte	0x9
	.uleb128 0x14
	.4byte	.LASF78
	.byte	0xa
	.uleb128 0x14
	.4byte	.LASF79
	.byte	0xb
	.uleb128 0x14
	.4byte	.LASF80
	.byte	0xc
	.uleb128 0x14
	.4byte	.LASF81
	.byte	0xd
	.uleb128 0x14
	.4byte	.LASF82
	.byte	0xe
	.uleb128 0x14
	.4byte	.LASF83
	.byte	0xf
	.uleb128 0x14
	.4byte	.LASF84
	.byte	0x10
	.uleb128 0x14
	.4byte	.LASF85
	.byte	0x11
	.uleb128 0x14
	.4byte	.LASF86
	.byte	0x12
	.uleb128 0x14
	.4byte	.LASF87
	.byte	0x13
	.uleb128 0x14
	.4byte	.LASF88
	.byte	0x14
	.uleb128 0x14
	.4byte	.LASF89
	.byte	0x15
	.uleb128 0x14
	.4byte	.LASF90
	.byte	0x16
	.uleb128 0x14
	.4byte	.LASF91
	.byte	0x17
	.uleb128 0x14
	.4byte	.LASF92
	.byte	0xa
	.uleb128 0x14
	.4byte	.LASF93
	.byte	0xa
	.uleb128 0x14
	.4byte	.LASF94
	.byte	0xe
	.uleb128 0x14
	.4byte	.LASF95
	.byte	0xa
	.uleb128 0x14
	.4byte	.LASF96
	.byte	0x3
	.uleb128 0x14
	.4byte	.LASF97
	.byte	0xa
	.uleb128 0x14
	.4byte	.LASF98
	.byte	0xd
	.uleb128 0x14
	.4byte	.LASF99
	.byte	0xe
	.uleb128 0x14
	.4byte	.LASF100
	.byte	0x12
	.byte	0
	.uleb128 0x13
	.4byte	.LASF101
	.byte	0x7
	.byte	0x4
	.4byte	0x40
	.byte	0xa
	.2byte	0x131
	.byte	0x6
	.4byte	0x4d3
	.uleb128 0x14
	.4byte	.LASF102
	.byte	0
	.uleb128 0x14
	.4byte	.LASF103
	.byte	0x1
	.uleb128 0x14
	.4byte	.LASF104
	.byte	0x2
	.uleb128 0x14
	.4byte	.LASF105
	.byte	0x3
	.byte	0
	.uleb128 0x11
	.4byte	.LASF106
	.byte	0xb
	.byte	0x11
	.byte	0xc
	.4byte	0x63
	.uleb128 0x11
	.4byte	.LASF107
	.byte	0xb
	.byte	0x12
	.byte	0xc
	.4byte	0x63
	.uleb128 0x18
	.4byte	.LASF112
	.byte	0x1
	.byte	0x10
	.byte	0x5
	.4byte	0x63
	.8byte	.LFB509
	.8byte	.LFE509-.LFB509
	.uleb128 0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF97:
	.string	"PG_foreign"
.LASF34:
	.string	"file_operations"
.LASF51:
	.string	"SYSTEM_BOOTING"
.LASF16:
	.string	"__con_initcall_start"
.LASF85:
	.string	"PG_mappedtodisk"
.LASF59:
	.string	"counter"
.LASF26:
	.string	"linux_banner"
.LASF75:
	.string	"PG_waiters"
.LASF39:
	.string	"panic_timeout"
.LASF96:
	.string	"PG_savepinned"
.LASF24:
	.string	"alternatives_applied"
.LASF61:
	.string	"c_false"
.LASF12:
	.string	"atomic_t"
.LASF5:
	.string	"short int"
.LASF48:
	.string	"panic_cpu"
.LASF27:
	.string	"linux_proc_banner"
.LASF58:
	.string	"system_state"
.LASF95:
	.string	"PG_pinned"
.LASF55:
	.string	"SYSTEM_POWER_OFF"
.LASF112:
	.string	"main"
.LASF32:
	.string	"kptr_restrict"
.LASF86:
	.string	"PG_reclaim"
.LASF107:
	.string	"lock_stat"
.LASF35:
	.string	"atomic_notifier_head"
.LASF94:
	.string	"PG_fscache"
.LASF43:
	.string	"panic_on_io_nmi"
.LASF80:
	.string	"PG_reserved"
.LASF36:
	.string	"panic_notifier_list"
.LASF28:
	.string	"console_printk"
.LASF81:
	.string	"PG_private"
.LASF53:
	.string	"SYSTEM_RUNNING"
.LASF68:
	.string	"PG_locked"
.LASF47:
	.string	"crash_kexec_post_notifiers"
.LASF91:
	.string	"__NR_PAGEFLAGS"
.LASF11:
	.string	"bool"
.LASF45:
	.string	"sysctl_panic_on_rcu_stall"
.LASF3:
	.string	"signed char"
.LASF87:
	.string	"PG_swapbacked"
.LASF56:
	.string	"SYSTEM_RESTART"
.LASF99:
	.string	"PG_double_map"
.LASF30:
	.string	"printk_delay_msec"
.LASF7:
	.string	"long long int"
.LASF111:
	.string	"taint_flag"
.LASF104:
	.string	"ZONE_MOVABLE"
.LASF64:
	.string	"hex_asc"
.LASF82:
	.string	"PG_private_2"
.LASF33:
	.string	"kmsg_fops"
.LASF37:
	.string	"panic_blink"
.LASF20:
	.string	"reset_devices"
.LASF29:
	.string	"devkmsg_log_str"
.LASF103:
	.string	"ZONE_NORMAL"
.LASF79:
	.string	"PG_arch_1"
.LASF74:
	.string	"PG_workingset"
.LASF13:
	.string	"pstate_check_t"
.LASF110:
	.string	"/home/xym/workspace/test/runninglinuxkernel_5.0"
.LASF105:
	.string	"__MAX_NR_ZONES"
.LASF4:
	.string	"unsigned char"
.LASF62:
	.string	"module"
.LASF70:
	.string	"PG_uptodate"
.LASF89:
	.string	"PG_mlocked"
.LASF25:
	.string	"__icache_flags"
.LASF8:
	.string	"long long unsigned int"
.LASF98:
	.string	"PG_slob_free"
.LASF2:
	.string	"unsigned int"
.LASF17:
	.string	"__con_initcall_end"
.LASF69:
	.string	"PG_referenced"
.LASF71:
	.string	"PG_dirty"
.LASF19:
	.string	"saved_command_line"
.LASF66:
	.string	"system_states"
.LASF6:
	.string	"short unsigned int"
.LASF92:
	.string	"PG_checked"
.LASF1:
	.string	"char"
.LASF9:
	.string	"long int"
.LASF67:
	.string	"pageflags"
.LASF41:
	.string	"panic_on_oops"
.LASF15:
	.string	"aarch32_opcode_cond_checks"
.LASF108:
	.ascii	"GNU C89 8.4.0 -mlittle-endian -mgeneral-regs-only -mabi=lp64"
	.ascii	" -g -O0 -std=gnu90 -fno-strict-aliasing -fno-common -fshort-"
	.ascii	"wchar -fno-PIE -fno-asynchronous-unwind-tables -fno-delete-n"
	.ascii	"ull-pointer-checks -fstack-protector-strong -fno-omit-"
	.string	"frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -fpatchable-function-entry=2 -fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fstack-check=no -fconserve-stack --param allow-store-data-races=0 -fstack-protector-strong"
.LASF57:
	.string	"SYSTEM_SUSPEND"
.LASF50:
	.string	"early_boot_irqs_disabled"
.LASF10:
	.string	"_Bool"
.LASF72:
	.string	"PG_lru"
.LASF21:
	.string	"rodata_enabled"
.LASF88:
	.string	"PG_unevictable"
.LASF54:
	.string	"SYSTEM_HALT"
.LASF52:
	.string	"SYSTEM_SCHEDULING"
.LASF63:
	.string	"taint_flags"
.LASF0:
	.string	"long unsigned int"
.LASF106:
	.string	"prove_locking"
.LASF14:
	.string	"initcall_entry_t"
.LASF93:
	.string	"PG_swapcache"
.LASF90:
	.string	"PG_hwpoison"
.LASF73:
	.string	"PG_active"
.LASF84:
	.string	"PG_head"
.LASF109:
	.string	"kernel/bounds.c"
.LASF101:
	.string	"zone_type"
.LASF18:
	.string	"boot_command_line"
.LASF22:
	.string	"late_time_init"
.LASF78:
	.string	"PG_owner_priv_1"
.LASF44:
	.string	"panic_on_warn"
.LASF42:
	.string	"panic_on_unrecovered_nmi"
.LASF40:
	.string	"panic_print"
.LASF23:
	.string	"initcall_debug"
.LASF76:
	.string	"PG_error"
.LASF83:
	.string	"PG_writeback"
.LASF102:
	.string	"ZONE_DMA32"
.LASF77:
	.string	"PG_slab"
.LASF31:
	.string	"dmesg_restrict"
.LASF49:
	.string	"root_mountflags"
.LASF38:
	.string	"oops_in_progress"
.LASF60:
	.string	"c_true"
.LASF46:
	.string	"sysctl_panic_on_stackoverflow"
.LASF100:
	.string	"PG_isolated"
.LASF65:
	.string	"hex_asc_upper"
	.ident	"GCC: (Ubuntu/Linaro 8.4.0-1ubuntu1~18.04) 8.4.0"
	.section	.note.GNU-stack,"",@progbits
