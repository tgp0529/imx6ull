#源码目录
KERNEL_SRC_DIR := $(TOP_DIR)/src/kernel
#输出目录
KERNEL_TARGET_DIR        := $(KERNEL_SRC_DIR)/out
#目标名称
KERNEL_TARGET_NAME       := kernel

KERNEL_COMPILE_OPT  := -C $(KERNEL_SRC_DIR)  CROSS_COMPILE=$(TARGET_CROSS) TARGET_DIR=$(KERNEL_TARGET_DIR) TARGET_NAME=$(KERNEL_TARGET_NAME) INSTALL_DIR=$(KERNEL_TARGET_DIR)

kernel-menuconfig:
	make $(KERNEL_COMPILE_OPT) menuconfig

kernel:
	make $(KERNEL_COMPILE_OPT) all

kernel-clean:
	make $(KERNEL_COMPILE_OPT) clean

.PHONY: kernel kernel-clean kernel-menuconfig
