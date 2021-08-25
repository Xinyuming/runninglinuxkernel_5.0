	.arch armv8-a
	.file	"devicetable-offsets.c"
// GNU C89 (Ubuntu/Linaro 8.4.0-1ubuntu1~18.04) version 8.4.0 (aarch64-linux-gnu)
//	compiled by GNU C version 8.4.0, GMP version 6.1.2, MPFR version 4.0.1, MPC version 1.1.0, isl version isl-0.19-GMP

// GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
// options passed:  -nostdinc -I ./arch/arm64/include
// -I ./arch/arm64/include/generated -I ./include
// -I ./arch/arm64/include/uapi -I ./arch/arm64/include/generated/uapi
// -I ./include/uapi -I ./include/generated/uapi
// -imultiarch aarch64-linux-gnu -D __KERNEL__ -D CC_USING_PATCHABLE_FENTRY
// -D KASAN_SHADOW_SCALE_SHIFT=3 -D CONFIG_AS_LSE=1
// -D KASAN_SHADOW_SCALE_SHIFT=3 -D KBUILD_BASENAME="devicetable_offsets"
// -D KBUILD_MODNAME="devicetable_offsets"
// -isystem /usr/lib/gcc-cross/aarch64-linux-gnu/8/include
// -include ./include/linux/kconfig.h
// -include ./include/linux/compiler_types.h
// -MD scripts/mod/.devicetable-offsets.s.d
// scripts/mod/devicetable-offsets.c -mlittle-endian -mgeneral-regs-only
// -mabi=lp64 -auxbase-strip scripts/mod/devicetable-offsets.s -g -O0 -Wall
// -Wundef -Werror=strict-prototypes -Wno-trigraphs
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
.LFB24:
	.file 1 "scripts/mod/devicetable-offsets.c"
	.loc 1 10 1
	.cfi_startproc
// scripts/mod/devicetable-offsets.c:11: 	DEVID(usb_device_id);
	.loc 1 11 2
#APP
// 11 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_usb_device_id 32 sizeof(struct usb_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:12: 	DEVID_FIELD(usb_device_id, match_flags);
	.loc 1 12 2
// 12 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_match_flags 0 offsetof(struct usb_device_id, match_flags)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:13: 	DEVID_FIELD(usb_device_id, idVendor);
	.loc 1 13 2
// 13 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_idVendor 2 offsetof(struct usb_device_id, idVendor)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:14: 	DEVID_FIELD(usb_device_id, idProduct);
	.loc 1 14 2
// 14 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_idProduct 4 offsetof(struct usb_device_id, idProduct)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:15: 	DEVID_FIELD(usb_device_id, bcdDevice_lo);
	.loc 1 15 2
// 15 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_bcdDevice_lo 6 offsetof(struct usb_device_id, bcdDevice_lo)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:16: 	DEVID_FIELD(usb_device_id, bcdDevice_hi);
	.loc 1 16 2
// 16 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_bcdDevice_hi 8 offsetof(struct usb_device_id, bcdDevice_hi)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:17: 	DEVID_FIELD(usb_device_id, bDeviceClass);
	.loc 1 17 2
// 17 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_bDeviceClass 10 offsetof(struct usb_device_id, bDeviceClass)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:18: 	DEVID_FIELD(usb_device_id, bDeviceSubClass);
	.loc 1 18 2
// 18 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_bDeviceSubClass 11 offsetof(struct usb_device_id, bDeviceSubClass)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:19: 	DEVID_FIELD(usb_device_id, bDeviceProtocol);
	.loc 1 19 2
// 19 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_bDeviceProtocol 12 offsetof(struct usb_device_id, bDeviceProtocol)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:20: 	DEVID_FIELD(usb_device_id, bInterfaceClass);
	.loc 1 20 2
// 20 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_bInterfaceClass 13 offsetof(struct usb_device_id, bInterfaceClass)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:21: 	DEVID_FIELD(usb_device_id, bInterfaceSubClass);
	.loc 1 21 2
// 21 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_bInterfaceSubClass 14 offsetof(struct usb_device_id, bInterfaceSubClass)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:22: 	DEVID_FIELD(usb_device_id, bInterfaceProtocol);
	.loc 1 22 2
// 22 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_bInterfaceProtocol 15 offsetof(struct usb_device_id, bInterfaceProtocol)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:23: 	DEVID_FIELD(usb_device_id, bInterfaceNumber);
	.loc 1 23 2
// 23 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_usb_device_id_bInterfaceNumber 16 offsetof(struct usb_device_id, bInterfaceNumber)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:25: 	DEVID(hid_device_id);
	.loc 1 25 2
// 25 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_hid_device_id 24 sizeof(struct hid_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:26: 	DEVID_FIELD(hid_device_id, bus);
	.loc 1 26 2
// 26 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_hid_device_id_bus 0 offsetof(struct hid_device_id, bus)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:27: 	DEVID_FIELD(hid_device_id, group);
	.loc 1 27 2
// 27 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_hid_device_id_group 2 offsetof(struct hid_device_id, group)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:28: 	DEVID_FIELD(hid_device_id, vendor);
	.loc 1 28 2
// 28 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_hid_device_id_vendor 4 offsetof(struct hid_device_id, vendor)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:29: 	DEVID_FIELD(hid_device_id, product);
	.loc 1 29 2
// 29 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_hid_device_id_product 8 offsetof(struct hid_device_id, product)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:31: 	DEVID(ieee1394_device_id);
	.loc 1 31 2
// 31 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_ieee1394_device_id 32 sizeof(struct ieee1394_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:32: 	DEVID_FIELD(ieee1394_device_id, match_flags);
	.loc 1 32 2
// 32 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ieee1394_device_id_match_flags 0 offsetof(struct ieee1394_device_id, match_flags)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:33: 	DEVID_FIELD(ieee1394_device_id, vendor_id);
	.loc 1 33 2
// 33 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ieee1394_device_id_vendor_id 4 offsetof(struct ieee1394_device_id, vendor_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:34: 	DEVID_FIELD(ieee1394_device_id, model_id);
	.loc 1 34 2
// 34 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ieee1394_device_id_model_id 8 offsetof(struct ieee1394_device_id, model_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:35: 	DEVID_FIELD(ieee1394_device_id, specifier_id);
	.loc 1 35 2
// 35 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ieee1394_device_id_specifier_id 12 offsetof(struct ieee1394_device_id, specifier_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:36: 	DEVID_FIELD(ieee1394_device_id, version);
	.loc 1 36 2
// 36 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ieee1394_device_id_version 16 offsetof(struct ieee1394_device_id, version)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:38: 	DEVID(pci_device_id);
	.loc 1 38 2
// 38 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_pci_device_id 32 sizeof(struct pci_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:39: 	DEVID_FIELD(pci_device_id, vendor);
	.loc 1 39 2
// 39 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pci_device_id_vendor 0 offsetof(struct pci_device_id, vendor)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:40: 	DEVID_FIELD(pci_device_id, device);
	.loc 1 40 2
// 40 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pci_device_id_device 4 offsetof(struct pci_device_id, device)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:41: 	DEVID_FIELD(pci_device_id, subvendor);
	.loc 1 41 2
// 41 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pci_device_id_subvendor 8 offsetof(struct pci_device_id, subvendor)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:42: 	DEVID_FIELD(pci_device_id, subdevice);
	.loc 1 42 2
// 42 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pci_device_id_subdevice 12 offsetof(struct pci_device_id, subdevice)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:43: 	DEVID_FIELD(pci_device_id, class);
	.loc 1 43 2
// 43 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pci_device_id_class 16 offsetof(struct pci_device_id, class)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:44: 	DEVID_FIELD(pci_device_id, class_mask);
	.loc 1 44 2
// 44 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pci_device_id_class_mask 20 offsetof(struct pci_device_id, class_mask)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:46: 	DEVID(ccw_device_id);
	.loc 1 46 2
// 46 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_ccw_device_id 16 sizeof(struct ccw_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:47: 	DEVID_FIELD(ccw_device_id, match_flags);
	.loc 1 47 2
// 47 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ccw_device_id_match_flags 0 offsetof(struct ccw_device_id, match_flags)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:48: 	DEVID_FIELD(ccw_device_id, cu_type);
	.loc 1 48 2
// 48 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ccw_device_id_cu_type 2 offsetof(struct ccw_device_id, cu_type)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:49: 	DEVID_FIELD(ccw_device_id, cu_model);
	.loc 1 49 2
// 49 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ccw_device_id_cu_model 6 offsetof(struct ccw_device_id, cu_model)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:50: 	DEVID_FIELD(ccw_device_id, dev_type);
	.loc 1 50 2
// 50 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ccw_device_id_dev_type 4 offsetof(struct ccw_device_id, dev_type)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:51: 	DEVID_FIELD(ccw_device_id, dev_model);
	.loc 1 51 2
// 51 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ccw_device_id_dev_model 7 offsetof(struct ccw_device_id, dev_model)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:53: 	DEVID(ap_device_id);
	.loc 1 53 2
// 53 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_ap_device_id 16 sizeof(struct ap_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:54: 	DEVID_FIELD(ap_device_id, dev_type);
	.loc 1 54 2
// 54 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ap_device_id_dev_type 2 offsetof(struct ap_device_id, dev_type)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:56: 	DEVID(css_device_id);
	.loc 1 56 2
// 56 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_css_device_id 16 sizeof(struct css_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:57: 	DEVID_FIELD(css_device_id, type);
	.loc 1 57 2
// 57 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_css_device_id_type 1 offsetof(struct css_device_id, type)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:59: 	DEVID(serio_device_id);
	.loc 1 59 2
// 59 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_serio_device_id 4 sizeof(struct serio_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:60: 	DEVID_FIELD(serio_device_id, type);
	.loc 1 60 2
// 60 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_serio_device_id_type 0 offsetof(struct serio_device_id, type)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:61: 	DEVID_FIELD(serio_device_id, proto);
	.loc 1 61 2
// 61 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_serio_device_id_proto 3 offsetof(struct serio_device_id, proto)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:62: 	DEVID_FIELD(serio_device_id, id);
	.loc 1 62 2
// 62 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_serio_device_id_id 2 offsetof(struct serio_device_id, id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:63: 	DEVID_FIELD(serio_device_id, extra);
	.loc 1 63 2
// 63 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_serio_device_id_extra 1 offsetof(struct serio_device_id, extra)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:65: 	DEVID(acpi_device_id);
	.loc 1 65 2
// 65 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_acpi_device_id 32 sizeof(struct acpi_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:66: 	DEVID_FIELD(acpi_device_id, id);
	.loc 1 66 2
// 66 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_acpi_device_id_id 0 offsetof(struct acpi_device_id, id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:67: 	DEVID_FIELD(acpi_device_id, cls);
	.loc 1 67 2
// 67 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_acpi_device_id_cls 24 offsetof(struct acpi_device_id, cls)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:68: 	DEVID_FIELD(acpi_device_id, cls_msk);
	.loc 1 68 2
// 68 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_acpi_device_id_cls_msk 28 offsetof(struct acpi_device_id, cls_msk)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:70: 	DEVID(pnp_device_id);
	.loc 1 70 2
// 70 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_pnp_device_id 16 sizeof(struct pnp_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:71: 	DEVID_FIELD(pnp_device_id, id);
	.loc 1 71 2
// 71 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pnp_device_id_id 0 offsetof(struct pnp_device_id, id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:73: 	DEVID(pnp_card_device_id);
	.loc 1 73 2
// 73 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_pnp_card_device_id 80 sizeof(struct pnp_card_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:74: 	DEVID_FIELD(pnp_card_device_id, devs);
	.loc 1 74 2
// 74 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pnp_card_device_id_devs 16 offsetof(struct pnp_card_device_id, devs)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:76: 	DEVID(pcmcia_device_id);
	.loc 1 76 2
// 76 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_pcmcia_device_id 80 sizeof(struct pcmcia_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:77: 	DEVID_FIELD(pcmcia_device_id, match_flags);
	.loc 1 77 2
// 77 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pcmcia_device_id_match_flags 0 offsetof(struct pcmcia_device_id, match_flags)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:78: 	DEVID_FIELD(pcmcia_device_id, manf_id);
	.loc 1 78 2
// 78 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pcmcia_device_id_manf_id 2 offsetof(struct pcmcia_device_id, manf_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:79: 	DEVID_FIELD(pcmcia_device_id, card_id);
	.loc 1 79 2
// 79 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pcmcia_device_id_card_id 4 offsetof(struct pcmcia_device_id, card_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:80: 	DEVID_FIELD(pcmcia_device_id, func_id);
	.loc 1 80 2
// 80 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pcmcia_device_id_func_id 6 offsetof(struct pcmcia_device_id, func_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:81: 	DEVID_FIELD(pcmcia_device_id, function);
	.loc 1 81 2
// 81 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pcmcia_device_id_function 7 offsetof(struct pcmcia_device_id, function)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:82: 	DEVID_FIELD(pcmcia_device_id, device_no);
	.loc 1 82 2
// 82 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pcmcia_device_id_device_no 8 offsetof(struct pcmcia_device_id, device_no)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:83: 	DEVID_FIELD(pcmcia_device_id, prod_id_hash);
	.loc 1 83 2
// 83 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_pcmcia_device_id_prod_id_hash 12 offsetof(struct pcmcia_device_id, prod_id_hash)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:85: 	DEVID(of_device_id);
	.loc 1 85 2
// 85 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_of_device_id 200 sizeof(struct of_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:86: 	DEVID_FIELD(of_device_id, name);
	.loc 1 86 2
// 86 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_of_device_id_name 0 offsetof(struct of_device_id, name)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:87: 	DEVID_FIELD(of_device_id, type);
	.loc 1 87 2
// 87 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_of_device_id_type 32 offsetof(struct of_device_id, type)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:88: 	DEVID_FIELD(of_device_id, compatible);
	.loc 1 88 2
// 88 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_of_device_id_compatible 64 offsetof(struct of_device_id, compatible)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:90: 	DEVID(vio_device_id);
	.loc 1 90 2
// 90 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_vio_device_id 64 sizeof(struct vio_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:91: 	DEVID_FIELD(vio_device_id, type);
	.loc 1 91 2
// 91 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_vio_device_id_type 0 offsetof(struct vio_device_id, type)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:92: 	DEVID_FIELD(vio_device_id, compat);
	.loc 1 92 2
// 92 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_vio_device_id_compat 32 offsetof(struct vio_device_id, compat)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:94: 	DEVID(input_device_id);
	.loc 1 94 2
// 94 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_input_device_id 200 sizeof(struct input_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:95: 	DEVID_FIELD(input_device_id, flags);
	.loc 1 95 2
// 95 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_flags 0 offsetof(struct input_device_id, flags)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:96: 	DEVID_FIELD(input_device_id, bustype);
	.loc 1 96 2
// 96 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_bustype 8 offsetof(struct input_device_id, bustype)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:97: 	DEVID_FIELD(input_device_id, vendor);
	.loc 1 97 2
// 97 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_vendor 10 offsetof(struct input_device_id, vendor)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:98: 	DEVID_FIELD(input_device_id, product);
	.loc 1 98 2
// 98 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_product 12 offsetof(struct input_device_id, product)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:99: 	DEVID_FIELD(input_device_id, version);
	.loc 1 99 2
// 99 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_version 14 offsetof(struct input_device_id, version)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:100: 	DEVID_FIELD(input_device_id, evbit);
	.loc 1 100 2
// 100 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_evbit 16 offsetof(struct input_device_id, evbit)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:101: 	DEVID_FIELD(input_device_id, keybit);
	.loc 1 101 2
// 101 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_keybit 24 offsetof(struct input_device_id, keybit)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:102: 	DEVID_FIELD(input_device_id, relbit);
	.loc 1 102 2
// 102 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_relbit 120 offsetof(struct input_device_id, relbit)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:103: 	DEVID_FIELD(input_device_id, absbit);
	.loc 1 103 2
// 103 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_absbit 128 offsetof(struct input_device_id, absbit)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:104: 	DEVID_FIELD(input_device_id, mscbit);
	.loc 1 104 2
// 104 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_mscbit 136 offsetof(struct input_device_id, mscbit)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:105: 	DEVID_FIELD(input_device_id, ledbit);
	.loc 1 105 2
// 105 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_ledbit 144 offsetof(struct input_device_id, ledbit)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:106: 	DEVID_FIELD(input_device_id, sndbit);
	.loc 1 106 2
// 106 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_sndbit 152 offsetof(struct input_device_id, sndbit)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:107: 	DEVID_FIELD(input_device_id, ffbit);
	.loc 1 107 2
// 107 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_ffbit 160 offsetof(struct input_device_id, ffbit)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:108: 	DEVID_FIELD(input_device_id, swbit);
	.loc 1 108 2
// 108 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_input_device_id_swbit 176 offsetof(struct input_device_id, swbit)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:110: 	DEVID(eisa_device_id);
	.loc 1 110 2
// 110 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_eisa_device_id 16 sizeof(struct eisa_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:111: 	DEVID_FIELD(eisa_device_id, sig);
	.loc 1 111 2
// 111 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_eisa_device_id_sig 0 offsetof(struct eisa_device_id, sig)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:113: 	DEVID(parisc_device_id);
	.loc 1 113 2
// 113 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_parisc_device_id 8 sizeof(struct parisc_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:114: 	DEVID_FIELD(parisc_device_id, hw_type);
	.loc 1 114 2
// 114 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_parisc_device_id_hw_type 0 offsetof(struct parisc_device_id, hw_type)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:115: 	DEVID_FIELD(parisc_device_id, hversion);
	.loc 1 115 2
// 115 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_parisc_device_id_hversion 2 offsetof(struct parisc_device_id, hversion)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:116: 	DEVID_FIELD(parisc_device_id, hversion_rev);
	.loc 1 116 2
// 116 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_parisc_device_id_hversion_rev 1 offsetof(struct parisc_device_id, hversion_rev)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:117: 	DEVID_FIELD(parisc_device_id, sversion);
	.loc 1 117 2
// 117 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_parisc_device_id_sversion 4 offsetof(struct parisc_device_id, sversion)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:119: 	DEVID(sdio_device_id);
	.loc 1 119 2
// 119 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_sdio_device_id 16 sizeof(struct sdio_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:120: 	DEVID_FIELD(sdio_device_id, class);
	.loc 1 120 2
// 120 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_sdio_device_id_class 0 offsetof(struct sdio_device_id, class)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:121: 	DEVID_FIELD(sdio_device_id, vendor);
	.loc 1 121 2
// 121 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_sdio_device_id_vendor 2 offsetof(struct sdio_device_id, vendor)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:122: 	DEVID_FIELD(sdio_device_id, device);
	.loc 1 122 2
// 122 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_sdio_device_id_device 4 offsetof(struct sdio_device_id, device)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:124: 	DEVID(ssb_device_id);
	.loc 1 124 2
// 124 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_ssb_device_id 6 sizeof(struct ssb_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:125: 	DEVID_FIELD(ssb_device_id, vendor);
	.loc 1 125 2
// 125 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ssb_device_id_vendor 0 offsetof(struct ssb_device_id, vendor)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:126: 	DEVID_FIELD(ssb_device_id, coreid);
	.loc 1 126 2
// 126 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ssb_device_id_coreid 2 offsetof(struct ssb_device_id, coreid)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:127: 	DEVID_FIELD(ssb_device_id, revision);
	.loc 1 127 2
// 127 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ssb_device_id_revision 4 offsetof(struct ssb_device_id, revision)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:129: 	DEVID(bcma_device_id);
	.loc 1 129 2
// 129 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_bcma_device_id 6 sizeof(struct bcma_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:130: 	DEVID_FIELD(bcma_device_id, manuf);
	.loc 1 130 2
// 130 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_bcma_device_id_manuf 0 offsetof(struct bcma_device_id, manuf)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:131: 	DEVID_FIELD(bcma_device_id, id);
	.loc 1 131 2
// 131 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_bcma_device_id_id 2 offsetof(struct bcma_device_id, id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:132: 	DEVID_FIELD(bcma_device_id, rev);
	.loc 1 132 2
// 132 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_bcma_device_id_rev 4 offsetof(struct bcma_device_id, rev)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:133: 	DEVID_FIELD(bcma_device_id, class);
	.loc 1 133 2
// 133 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_bcma_device_id_class 5 offsetof(struct bcma_device_id, class)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:135: 	DEVID(virtio_device_id);
	.loc 1 135 2
// 135 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_virtio_device_id 8 sizeof(struct virtio_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:136: 	DEVID_FIELD(virtio_device_id, device);
	.loc 1 136 2
// 136 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_virtio_device_id_device 0 offsetof(struct virtio_device_id, device)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:137: 	DEVID_FIELD(virtio_device_id, vendor);
	.loc 1 137 2
// 137 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_virtio_device_id_vendor 4 offsetof(struct virtio_device_id, vendor)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:139: 	DEVID(hv_vmbus_device_id);
	.loc 1 139 2
// 139 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_hv_vmbus_device_id 24 sizeof(struct hv_vmbus_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:140: 	DEVID_FIELD(hv_vmbus_device_id, guid);
	.loc 1 140 2
// 140 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_hv_vmbus_device_id_guid 0 offsetof(struct hv_vmbus_device_id, guid)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:142: 	DEVID(rpmsg_device_id);
	.loc 1 142 2
// 142 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_rpmsg_device_id 32 sizeof(struct rpmsg_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:143: 	DEVID_FIELD(rpmsg_device_id, name);
	.loc 1 143 2
// 143 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_rpmsg_device_id_name 0 offsetof(struct rpmsg_device_id, name)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:145: 	DEVID(i2c_device_id);
	.loc 1 145 2
// 145 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_i2c_device_id 32 sizeof(struct i2c_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:146: 	DEVID_FIELD(i2c_device_id, name);
	.loc 1 146 2
// 146 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_i2c_device_id_name 0 offsetof(struct i2c_device_id, name)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:148: 	DEVID(spi_device_id);
	.loc 1 148 2
// 148 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_spi_device_id 40 sizeof(struct spi_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:149: 	DEVID_FIELD(spi_device_id, name);
	.loc 1 149 2
// 149 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_spi_device_id_name 0 offsetof(struct spi_device_id, name)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:151: 	DEVID(dmi_system_id);
	.loc 1 151 2
// 151 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_dmi_system_id 344 sizeof(struct dmi_system_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:152: 	DEVID_FIELD(dmi_system_id, matches);
	.loc 1 152 2
// 152 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_dmi_system_id_matches 16 offsetof(struct dmi_system_id, matches)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:154: 	DEVID(platform_device_id);
	.loc 1 154 2
// 154 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_platform_device_id 32 sizeof(struct platform_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:155: 	DEVID_FIELD(platform_device_id, name);
	.loc 1 155 2
// 155 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_platform_device_id_name 0 offsetof(struct platform_device_id, name)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:157: 	DEVID(mdio_device_id);
	.loc 1 157 2
// 157 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_mdio_device_id 8 sizeof(struct mdio_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:158: 	DEVID_FIELD(mdio_device_id, phy_id);
	.loc 1 158 2
// 158 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_mdio_device_id_phy_id 0 offsetof(struct mdio_device_id, phy_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:159: 	DEVID_FIELD(mdio_device_id, phy_id_mask);
	.loc 1 159 2
// 159 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_mdio_device_id_phy_id_mask 4 offsetof(struct mdio_device_id, phy_id_mask)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:161: 	DEVID(zorro_device_id);
	.loc 1 161 2
// 161 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_zorro_device_id 16 sizeof(struct zorro_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:162: 	DEVID_FIELD(zorro_device_id, id);
	.loc 1 162 2
// 162 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_zorro_device_id_id 0 offsetof(struct zorro_device_id, id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:164: 	DEVID(isapnp_device_id);
	.loc 1 164 2
// 164 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_isapnp_device_id 16 sizeof(struct isapnp_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:165: 	DEVID_FIELD(isapnp_device_id, vendor);
	.loc 1 165 2
// 165 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_isapnp_device_id_vendor 4 offsetof(struct isapnp_device_id, vendor)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:166: 	DEVID_FIELD(isapnp_device_id, function);
	.loc 1 166 2
// 166 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_isapnp_device_id_function 6 offsetof(struct isapnp_device_id, function)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:168: 	DEVID(ipack_device_id);
	.loc 1 168 2
// 168 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_ipack_device_id 12 sizeof(struct ipack_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:169: 	DEVID_FIELD(ipack_device_id, format);
	.loc 1 169 2
// 169 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ipack_device_id_format 0 offsetof(struct ipack_device_id, format)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:170: 	DEVID_FIELD(ipack_device_id, vendor);
	.loc 1 170 2
// 170 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ipack_device_id_vendor 4 offsetof(struct ipack_device_id, vendor)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:171: 	DEVID_FIELD(ipack_device_id, device);
	.loc 1 171 2
// 171 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ipack_device_id_device 8 offsetof(struct ipack_device_id, device)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:173: 	DEVID(amba_id);
	.loc 1 173 2
// 173 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_amba_id 16 sizeof(struct amba_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:174: 	DEVID_FIELD(amba_id, id);
	.loc 1 174 2
// 174 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_amba_id_id 0 offsetof(struct amba_id, id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:175: 	DEVID_FIELD(amba_id, mask);
	.loc 1 175 2
// 175 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_amba_id_mask 4 offsetof(struct amba_id, mask)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:177: 	DEVID(mips_cdmm_device_id);
	.loc 1 177 2
// 177 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_mips_cdmm_device_id 1 sizeof(struct mips_cdmm_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:178: 	DEVID_FIELD(mips_cdmm_device_id, type);
	.loc 1 178 2
// 178 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_mips_cdmm_device_id_type 0 offsetof(struct mips_cdmm_device_id, type)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:180: 	DEVID(x86_cpu_id);
	.loc 1 180 2
// 180 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_x86_cpu_id 16 sizeof(struct x86_cpu_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:181: 	DEVID_FIELD(x86_cpu_id, feature);
	.loc 1 181 2
// 181 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_x86_cpu_id_feature 6 offsetof(struct x86_cpu_id, feature)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:182: 	DEVID_FIELD(x86_cpu_id, family);
	.loc 1 182 2
// 182 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_x86_cpu_id_family 2 offsetof(struct x86_cpu_id, family)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:183: 	DEVID_FIELD(x86_cpu_id, model);
	.loc 1 183 2
// 183 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_x86_cpu_id_model 4 offsetof(struct x86_cpu_id, model)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:184: 	DEVID_FIELD(x86_cpu_id, vendor);
	.loc 1 184 2
// 184 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_x86_cpu_id_vendor 0 offsetof(struct x86_cpu_id, vendor)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:186: 	DEVID(cpu_feature);
	.loc 1 186 2
// 186 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_cpu_feature 2 sizeof(struct cpu_feature)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:187: 	DEVID_FIELD(cpu_feature, feature);
	.loc 1 187 2
// 187 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_cpu_feature_feature 0 offsetof(struct cpu_feature, feature)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:189: 	DEVID(mei_cl_device_id);
	.loc 1 189 2
// 189 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_mei_cl_device_id 64 sizeof(struct mei_cl_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:190: 	DEVID_FIELD(mei_cl_device_id, name);
	.loc 1 190 2
// 190 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_mei_cl_device_id_name 0 offsetof(struct mei_cl_device_id, name)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:191: 	DEVID_FIELD(mei_cl_device_id, uuid);
	.loc 1 191 2
// 191 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_mei_cl_device_id_uuid 32 offsetof(struct mei_cl_device_id, uuid)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:192: 	DEVID_FIELD(mei_cl_device_id, version);
	.loc 1 192 2
// 192 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_mei_cl_device_id_version 48 offsetof(struct mei_cl_device_id, version)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:194: 	DEVID(rio_device_id);
	.loc 1 194 2
// 194 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_rio_device_id 8 sizeof(struct rio_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:195: 	DEVID_FIELD(rio_device_id, did);
	.loc 1 195 2
// 195 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_rio_device_id_did 0 offsetof(struct rio_device_id, did)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:196: 	DEVID_FIELD(rio_device_id, vid);
	.loc 1 196 2
// 196 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_rio_device_id_vid 2 offsetof(struct rio_device_id, vid)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:197: 	DEVID_FIELD(rio_device_id, asm_did);
	.loc 1 197 2
// 197 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_rio_device_id_asm_did 4 offsetof(struct rio_device_id, asm_did)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:198: 	DEVID_FIELD(rio_device_id, asm_vid);
	.loc 1 198 2
// 198 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_rio_device_id_asm_vid 6 offsetof(struct rio_device_id, asm_vid)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:200: 	DEVID(ulpi_device_id);
	.loc 1 200 2
// 200 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_ulpi_device_id 16 sizeof(struct ulpi_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:201: 	DEVID_FIELD(ulpi_device_id, vendor);
	.loc 1 201 2
// 201 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ulpi_device_id_vendor 0 offsetof(struct ulpi_device_id, vendor)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:202: 	DEVID_FIELD(ulpi_device_id, product);
	.loc 1 202 2
// 202 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_ulpi_device_id_product 2 offsetof(struct ulpi_device_id, product)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:204: 	DEVID(hda_device_id);
	.loc 1 204 2
// 204 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_hda_device_id 32 sizeof(struct hda_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:205: 	DEVID_FIELD(hda_device_id, vendor_id);
	.loc 1 205 2
// 205 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_hda_device_id_vendor_id 0 offsetof(struct hda_device_id, vendor_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:206: 	DEVID_FIELD(hda_device_id, rev_id);
	.loc 1 206 2
// 206 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_hda_device_id_rev_id 4 offsetof(struct hda_device_id, rev_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:207: 	DEVID_FIELD(hda_device_id, api_version);
	.loc 1 207 2
// 207 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_hda_device_id_api_version 8 offsetof(struct hda_device_id, api_version)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:209: 	DEVID(sdw_device_id);
	.loc 1 209 2
// 209 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_sdw_device_id 16 sizeof(struct sdw_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:210: 	DEVID_FIELD(sdw_device_id, mfg_id);
	.loc 1 210 2
// 210 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_sdw_device_id_mfg_id 0 offsetof(struct sdw_device_id, mfg_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:211: 	DEVID_FIELD(sdw_device_id, part_id);
	.loc 1 211 2
// 211 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_sdw_device_id_part_id 2 offsetof(struct sdw_device_id, part_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:213: 	DEVID(fsl_mc_device_id);
	.loc 1 213 2
// 213 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_fsl_mc_device_id 18 sizeof(struct fsl_mc_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:214: 	DEVID_FIELD(fsl_mc_device_id, vendor);
	.loc 1 214 2
// 214 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_fsl_mc_device_id_vendor 0 offsetof(struct fsl_mc_device_id, vendor)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:215: 	DEVID_FIELD(fsl_mc_device_id, obj_type);
	.loc 1 215 2
// 215 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_fsl_mc_device_id_obj_type 2 offsetof(struct fsl_mc_device_id, obj_type)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:217: 	DEVID(tb_service_id);
	.loc 1 217 2
// 217 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_tb_service_id 40 sizeof(struct tb_service_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:218: 	DEVID_FIELD(tb_service_id, match_flags);
	.loc 1 218 2
// 218 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_tb_service_id_match_flags 0 offsetof(struct tb_service_id, match_flags)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:219: 	DEVID_FIELD(tb_service_id, protocol_key);
	.loc 1 219 2
// 219 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_tb_service_id_protocol_key 4 offsetof(struct tb_service_id, protocol_key)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:220: 	DEVID_FIELD(tb_service_id, protocol_id);
	.loc 1 220 2
// 220 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_tb_service_id_protocol_id 16 offsetof(struct tb_service_id, protocol_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:221: 	DEVID_FIELD(tb_service_id, protocol_version);
	.loc 1 221 2
// 221 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_tb_service_id_protocol_version 20 offsetof(struct tb_service_id, protocol_version)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:222: 	DEVID_FIELD(tb_service_id, protocol_revision);
	.loc 1 222 2
// 222 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_tb_service_id_protocol_revision 24 offsetof(struct tb_service_id, protocol_revision)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:224: 	DEVID(typec_device_id);
	.loc 1 224 2
// 224 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->SIZE_typec_device_id 16 sizeof(struct typec_device_id)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:225: 	DEVID_FIELD(typec_device_id, svid);
	.loc 1 225 2
// 225 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_typec_device_id_svid 0 offsetof(struct typec_device_id, svid)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:226: 	DEVID_FIELD(typec_device_id, mode);
	.loc 1 226 2
// 226 "scripts/mod/devicetable-offsets.c" 1
	
.ascii "->OFF_typec_device_id_mode 2 offsetof(struct typec_device_id, mode)"	//
// 0 "" 2
// scripts/mod/devicetable-offsets.c:228: 	return 0;
	.loc 1 228 9
#NO_APP
	mov	w0, 0	// _1,
// scripts/mod/devicetable-offsets.c:229: }
	.loc 1 229 1
	ret	
	.cfi_endproc
.LFE24:
	.size	main, .-main
.Letext0:
	.file 2 "./include/uapi/asm-generic/int-ll64.h"
	.file 3 "./include/uapi/linux/uuid.h"
	.file 4 "./include/linux/uuid.h"
	.file 5 "./include/asm-generic/int-ll64.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x159
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF18
	.byte	0x1
	.4byte	.LASF19
	.4byte	.LASF20
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
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF3
	.uleb128 0x3
	.4byte	.LASF9
	.byte	0x2
	.byte	0x15
	.byte	0x17
	.4byte	0x55
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
	.uleb128 0x5
	.string	"u8"
	.byte	0x5
	.byte	0x11
	.byte	0xf
	.4byte	0x49
	.uleb128 0x6
	.4byte	0x7f
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF11
	.uleb128 0x7
	.byte	0x10
	.byte	0x3
	.byte	0x17
	.byte	0x9
	.4byte	0xb2
	.uleb128 0x8
	.string	"b"
	.byte	0x3
	.byte	0x18
	.byte	0x7
	.4byte	0xb2
	.byte	0
	.byte	0
	.uleb128 0x9
	.4byte	0x49
	.4byte	0xc2
	.uleb128 0xa
	.4byte	0x2d
	.byte	0xf
	.byte	0
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x19
	.byte	0x3
	.4byte	0x9d
	.uleb128 0x6
	.4byte	0xc2
	.uleb128 0x7
	.byte	0x10
	.byte	0x4
	.byte	0x18
	.byte	0x9
	.4byte	0xe8
	.uleb128 0x8
	.string	"b"
	.byte	0x4
	.byte	0x19
	.byte	0x7
	.4byte	0xb2
	.byte	0
	.byte	0
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x4
	.byte	0x1a
	.byte	0x3
	.4byte	0xd3
	.uleb128 0x6
	.4byte	0xe8
	.uleb128 0xb
	.4byte	.LASF14
	.byte	0x4
	.byte	0x29
	.byte	0x15
	.4byte	0xce
	.uleb128 0xb
	.4byte	.LASF15
	.byte	0x4
	.byte	0x2a
	.byte	0x15
	.4byte	0xf4
	.uleb128 0x9
	.4byte	0x8a
	.4byte	0x121
	.uleb128 0xa
	.4byte	0x2d
	.byte	0xf
	.byte	0
	.uleb128 0x6
	.4byte	0x111
	.uleb128 0xb
	.4byte	.LASF16
	.byte	0x4
	.byte	0x51
	.byte	0x11
	.4byte	0x121
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x4
	.byte	0x52
	.byte	0x11
	.4byte	0x121
	.uleb128 0xc
	.4byte	.LASF21
	.byte	0x1
	.byte	0x9
	.byte	0x5
	.4byte	0x6a
	.8byte	.LFB24
	.8byte	.LFE24-.LFB24
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
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x6
	.uleb128 0x26
	.byte	0
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
	.uleb128 0x8
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
.LASF7:
	.string	"long long int"
.LASF9:
	.string	"__u8"
.LASF2:
	.string	"unsigned int"
.LASF4:
	.string	"unsigned char"
.LASF21:
	.string	"main"
.LASF13:
	.string	"uuid_t"
.LASF12:
	.string	"guid_t"
.LASF0:
	.string	"long unsigned int"
.LASF8:
	.string	"long long unsigned int"
.LASF14:
	.string	"guid_null"
.LASF16:
	.string	"guid_index"
.LASF15:
	.string	"uuid_null"
.LASF1:
	.string	"char"
.LASF18:
	.ascii	"GNU C89 8.4.0 -mlittle-endian -mgeneral-regs-only -mabi=lp64"
	.ascii	" -g -O0 -std=gnu90 -fno-strict-aliasing -fno-common -fshort-"
	.ascii	"wchar -fno-PIE -fno-asynchronous-unwind-tables -fno-delete-n"
	.ascii	"ull-pointer-checks -fstack-protector-strong -fno-omit-"
	.string	"frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -fpatchable-function-entry=2 -fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fstack-check=no -fconserve-stack --param allow-store-data-races=0 -fstack-protector-strong"
.LASF10:
	.string	"long int"
.LASF17:
	.string	"uuid_index"
.LASF11:
	.string	"_Bool"
.LASF6:
	.string	"short unsigned int"
.LASF3:
	.string	"signed char"
.LASF19:
	.string	"scripts/mod/devicetable-offsets.c"
.LASF20:
	.string	"/home/xym/workspace/test/runninglinuxkernel_5.0"
.LASF5:
	.string	"short int"
	.ident	"GCC: (Ubuntu/Linaro 8.4.0-1ubuntu1~18.04) 8.4.0"
	.section	.note.GNU-stack,"",@progbits
