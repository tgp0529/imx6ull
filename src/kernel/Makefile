KERNEL_SRC=$(SRC_DIR)/kernel/src
KERNEL_CFLAG=-C $(KERNEL_SRC) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) -j8
KERNEL_CONFIG=src/arch/arm/configs/imx_alientek_emmc_defconfig
KERNEL_IMAGE=src/arch/arm/boot/zImage
KERNEL_INSTALL_FLAG = $(KERNEL_CFLAG) INSTALL_MOD_PATH=$(INSTALL_DIR) INSTALL_MOD_STRIP=1

-include drivers/drivers.mk
-include drivers/*/*.mk

drivers: $(DRV_MK)
drivers-clean: $(DRV_CLEAN)

menuconfig:
	@cp $(KERNEL_CONFIG) src/.config
	make $(KERNEL_CFLAG) menuconfig
	@cp src/.config $(KERNEL_CONFIG)
linux:
	make $(KERNEL_CFLAG) imx_alientek_emmc_defconfig
	make $(KERNEL_CFLAG)
	make $(KERNEL_INSTALL_FLAG) modules_install
	#make $(KERNEL_CFLAG) zImage
	@cp -af $(KERNEL_IMAGE) $(INSTALL_DIR)/$(TARGET_NAME) 

linux-clean:
	make $(KERNEL_CFLAG)  distclean
	@rm -rf $(INSTALL_DIR)/$(TARGET_NAME)

all:linux drivers
clean:linux-clean drivers-clean
