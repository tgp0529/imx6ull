ARM_LINUX_TOOCHAIN_DIR =/usr/local/arm/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf

TARGET_CROSS        := $(ARM_LINUX_TOOCHAIN_DIR)/bin/arm-linux-gnueabihf-
TARGET_CC           := $(TARGET_CROSS)gcc
TARGET_CXX          := $(TARGET_CROSS)g++
TARGET_AR           := $(TARGET_CROSS)ar
TARGET_LD           := $(TARGET_CROSS)ld
TARGET_STRIP        := $(TARGET_CROSS)strip
