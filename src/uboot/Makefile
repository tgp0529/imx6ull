UBOOT_CFLAG=-C src ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE)
UBOOT_CONFIG=mx6ull_alientek_emmc_defconfig
UBOOT_IMAGE=src/u-boot.imx


menuconfig:
	@cp src/configs/$(UBOOT_CONFIG) src/.config
	make $(UBOOT_CFLAG) menuconfig
	@cp src/.config src/configs/$(UBOOT_CONFIG)
all:
	make $(UBOOT_CFLAG) $(UBOOT_CONFIG)
	make $(UBOOT_CFLAG) -j8
	@cp -af $(UBOOT_IMAGE) $(INSTALL_DIR)/$(TARGET_NAME) 

clean:
	make $(UBOOT_CFLAG)  distclean
	@rm -rf $(INSTALL_DIR)/$(TARGET_NAME)
