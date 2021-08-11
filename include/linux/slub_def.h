/* SPDX-License-Identifier: GPL-2.0 */
#ifndef _LINUX_SLUB_DEF_H
#define _LINUX_SLUB_DEF_H

/*
 * SLUB : A Slab allocator without object queues.
 *
 * (C) 2007 SGI, Christoph Lameter
 */
#include <linux/kobject.h>

enum stat_item {
	ALLOC_FASTPATH,		/* Allocation from cpu slab */
	ALLOC_SLOWPATH,		/* Allocation by getting a new cpu slab */
	FREE_FASTPATH,		/* Free to cpu slab */
	FREE_SLOWPATH,		/* Freeing not to cpu slab */
	FREE_FROZEN,		/* Freeing to frozen slab */
	FREE_ADD_PARTIAL,	/* Freeing moves slab to partial list */
	FREE_REMOVE_PARTIAL,	/* Freeing removes last object */
	ALLOC_FROM_PARTIAL,	/* Cpu slab acquired from node partial list */
	ALLOC_SLAB,		/* Cpu slab acquired from page allocator */
	ALLOC_REFILL,		/* Refill cpu slab from slab freelist */
	ALLOC_NODE_MISMATCH,	/* Switching cpu slab */
	FREE_SLAB,		/* Slab freed to the page allocator */
	CPUSLAB_FLUSH,		/* Abandoning of the cpu slab */
	DEACTIVATE_FULL,	/* Cpu slab was full when deactivated */
	DEACTIVATE_EMPTY,	/* Cpu slab was empty when deactivated */
	DEACTIVATE_TO_HEAD,	/* Cpu slab was moved to the head of partials */
	DEACTIVATE_TO_TAIL,	/* Cpu slab was moved to the tail of partials */
	DEACTIVATE_REMOTE_FREES,/* Slab contained remotely freed objects */
	DEACTIVATE_BYPASS,	/* Implicit deactivation */
	ORDER_FALLBACK,		/* Number of times fallback was necessary */
	CMPXCHG_DOUBLE_CPU_FAIL,/* Failure of this_cpu_cmpxchg_double */
	CMPXCHG_DOUBLE_FAIL,	/* Number of times that cmpxchg double did not match */
	CPU_PARTIAL_ALLOC,	/* Used cpu partial on alloc */
	CPU_PARTIAL_FREE,	/* Refill cpu partial on free */
	CPU_PARTIAL_NODE,	/* Refill cpu partial from node partial */
	CPU_PARTIAL_DRAIN,	/* Drain cpu partial to node partial */
	NR_SLUB_STAT_ITEMS };

struct kmem_cache_cpu {
		/*指向下面page指向的slab中的第一个free object*/
	void **freelist;	/* Pointer to next available object */
	unsigned long tid;	/* Globally unique transaction id */
		/*指向当前正在使用的slab*/
	struct page *page;	/* The slab from which we are allocating */
#ifdef CONFIG_SLUB_CPU_PARTIAL
/*本地slab缓存池中的partial slab链表*/
	struct page *partial;	/* Partially allocated frozen slabs */
#endif
#ifdef CONFIG_SLUB_STATS
	unsigned stat[NR_SLUB_STAT_ITEMS];
#endif
};

#ifdef CONFIG_SLUB_CPU_PARTIAL
#define slub_percpu_partial(c)		((c)->partial)

#define slub_set_percpu_partial(c, p)		\
({						\
	slub_percpu_partial(c) = (p)->next;	\
})

#define slub_percpu_partial_read_once(c)     READ_ONCE(slub_percpu_partial(c))
#else
#define slub_percpu_partial(c)			NULL

#define slub_set_percpu_partial(c, p)

#define slub_percpu_partial_read_once(c)	NULL
#endif // CONFIG_SLUB_CPU_PARTIAL

/*
 * Word size structure that can be atomically updated or read and that
 * contains both the order and the number of objects that a slab of the
 * given order would contain.
 */
struct kmem_cache_order_objects {
	unsigned int x;
};

/*
 * Slab cache management.
 */
struct kmem_cache {
	/*per-cpu变量，用来实现每个CPU上的slab缓存。好处如下：
      1.促使cpu_slab->freelist可以无锁访问，避免了竞争，提升分配速度
      2.使得本地cpu缓存中分配出的objects被同一cpu访问，提升TLB对object的命中率(因为一个page中有多个object，他们共用同一个PTE)
   */
	struct kmem_cache_cpu __percpu *cpu_slab;
	/* Used for retriving partial slabs etc */
	/*下面这些是初始化kmem_cache时会设置的一些变量 */
	/*分配时会用到的flags*/
	slab_flags_t flags;
	/*kmem_cache_shrink缩减partial slabs时，将被保有slab的最小值。由函数set_min_partial(s, ilog2(s->size)/2)设置。*/
	unsigned long min_partial;
	/*object的实际大小，包含元数据和对齐的空间*/
	unsigned int size;	/* The size of an object including meta data */
	/*object中payload的大小，即目标数据结构的实际大小*/
	unsigned int object_size;/* The size of an object without meta data */
	/*每个free object中都存了next free object的地址，但是并未存在object的首地址，而是首地址加上offset的地方*/
	unsigned int offset;	/* Free pointer offset. */
#ifdef CONFIG_SLUB_CPU_PARTIAL
	/* Number of per cpu partial objects to keep around */
	unsigned int cpu_partial;
#endif
	/*此结构体实际是个unsigned int，里面存了单个slab的占用的order数和一个slab中object的数量*/
	struct kmem_cache_order_objects oo;

	/* Allocation and freeing of slabs */
	struct kmem_cache_order_objects max;
	struct kmem_cache_order_objects min;
	/*标准gfp掩码，用于从buddy分配页面时*/
	gfp_t allocflags;	/* gfp flags to use on each alloc */
	int refcount;		/* Refcount for slab cache destroy */
	/*object的构造函数，通常不使用*/
	void (*ctor)(void *);
	/*object中到metadata的偏移*/
	unsigned int inuse;		/* Offset to metadata */
	/*对齐大小。澄清：slab中对齐方式通常有两种。1是按处理器字长对齐;2是按照cacheline大小对齐。*/
	unsigned int align;		/* Alignment */
	/*若flags中使用REDZONE时有意义*/
	unsigned int red_left_pad;	/* Left redzone padding size */
	/*对象名称，例：mm_struct task_struct*/
	const char *name;	/* Name (only for display!) */
	/*kmem_cache的链表结构，通过此成员串在slab_caches链表上*/
	struct list_head list;	/* List of slab caches */
#ifdef CONFIG_SYSFS
	struct kobject kobj;	/* For sysfs */
	struct work_struct kobj_remove_work;
#endif
#ifdef CONFIG_MEMCG
	struct memcg_cache_params memcg_params;
	/* for propagation, maximum size of a stored attr */
	unsigned int max_attr_size;
#ifdef CONFIG_SYSFS
	struct kset *memcg_kset;
#endif
#endif

#ifdef CONFIG_SLAB_FREELIST_HARDENED
	unsigned long random;
#endif

#ifdef CONFIG_NUMA
	/*
	 * Defragmentation by allocating from a remote node.
	 */
	unsigned int remote_node_defrag_ratio;
#endif

#ifdef CONFIG_SLAB_FREELIST_RANDOM
	unsigned int *random_seq;
#endif

#ifdef CONFIG_KASAN
	struct kasan_cache kasan_info;
#endif
	/*下面两个成员用于表示对象内部的一块空间，使userspace可以访问其中的内容。具体可以看kmem_cache_create_usercopy的实现*/
	unsigned int useroffset;	/* Usercopy region offset */
	unsigned int usersize;		/* Usercopy region size */
	/*每个node对应一个数组项，kmem_cache_node中包含partial slab链表*/
	struct kmem_cache_node *node[MAX_NUMNODES];
};

#ifdef CONFIG_SLUB_CPU_PARTIAL
#define slub_cpu_partial(s)		((s)->cpu_partial)
#define slub_set_cpu_partial(s, n)		\
({						\
	slub_cpu_partial(s) = (n);		\
})
#else
#define slub_cpu_partial(s)		(0)
#define slub_set_cpu_partial(s, n)
#endif // CONFIG_SLUB_CPU_PARTIAL

#ifdef CONFIG_SYSFS
#define SLAB_SUPPORTS_SYSFS
void sysfs_slab_unlink(struct kmem_cache *);
void sysfs_slab_release(struct kmem_cache *);
#else
static inline void sysfs_slab_unlink(struct kmem_cache *s)
{
}
static inline void sysfs_slab_release(struct kmem_cache *s)
{
}
#endif

void object_err(struct kmem_cache *s, struct page *page,
		u8 *object, char *reason);

void *fixup_red_left(struct kmem_cache *s, void *p);

static inline void *nearest_obj(struct kmem_cache *cache, struct page *page,
				void *x) {
	void *object = x - (x - page_address(page)) % cache->size;
	void *last_object = page_address(page) +
		(page->objects - 1) * cache->size;
	void *result = (unlikely(object > last_object)) ? last_object : object;

	result = fixup_red_left(cache, result);
	return result;
}

#endif /* _LINUX_SLUB_DEF_H */
