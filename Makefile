TOP_DIR := $(shell pwd)
SRC_DIR := $(TOP_DIR)/src
BUILD_DIR := $(TOP_DIR)/build

export TOP_DIR
export SRC_DIR
export BUILD_DIR


include $(BUILD_DIR)/build.mk
include $(BUILD_DIR)/rules.mk
#include $(BUILD_DIR)/platform.mk
