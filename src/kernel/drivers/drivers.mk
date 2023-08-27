DRIVERS_MOD_FLAG                = $(KERNEL_CFLAG) M=$(MODULE_DIR) -j8
DRIVERS_MODINSTALL_FLAG = INSTALL_MOD_PATH=$(INSTALL_DIR) $(DRIVERS_MOD_FLAG) INSTALL_MOD_STRIP=1


# 避免进入无效的编译目录
ifeq ("$(MODULE_DIR)", "")
MODULE_DIR = xxxooo
endif

ifeq ("$(MODULE_NAME)", "")
MODULE_NAME     = $(shell basename $(MODULE_DIR)).ko
endif

touch_symvers:
	$(shell if [ ! -e $(INSTALL_DIR)/Module.symvers ];then \
        cp -af $(KERNEL_SRC)/Module.symvers $(INSTALL_DIR)/Module.symvers; \
        fi)

build_linux_module:
	make $(DRIVERS_MOD_FLAG) modules
	make $(DRIVERS_MODINSTALL_FLAG) modules_install

clean_linux_module:
	make $(DRIVERS_MOD_FLAG) clean
	-rm -rf $(INSTALL_DIR)/lib
	-rm -rf  $(MODULE_DIR)/.*.tmp $(MODULE_DIR)/.tmp*

clean_symvers:
	@rm -rf $(INSTALL_DIR)/Module.symvers
