include $(BUILD_DIR)/platform.mk


APPS :=
APPS_CLEAN :=

SYS :=
SYS_CLEAN :=

include $(BUILD_DIR)/src/src.mk

all: $(SYS) $(APPS) 
clean: $(APPS_CLEAN) $(SYS_CLEAN)
distclean: $(APPS_CLEAN) $(SYS_CLEAN)

.PHONY : all clean distclean
