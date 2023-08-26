#源码目录
UBOOT_SRC_DIR := $(TOP_DIR)/src/uboot
#输出目录
UBOOT_TARGET_DIR        := $(UBOOT_SRC_DIR)/out
#目标名称
UBOOT_TARGET_NAME       := uboot

UBOOT_COMPILE_OPT  := -C $(UBOOT_SRC_DIR)  CROSS_COMPILE=$(TARGET_CROSS) TARGET_DIR=$(UBOOT_TARGET_DIR) TARGET_NAME=$(UBOOT_TARGET_NAME) INSTALL_DIR=$(UBOOT_TARGET_DIR)

uboot-menuconfig:
	make $(UBOOT_COMPILE_OPT) menuconfig

uboot:
	make $(UBOOT_COMPILE_OPT) all

uboot-clean:
	make $(UBOOT_COMPILE_OPT) clean

.PHONY: uboot uboot-clean uboot-menuconfig
