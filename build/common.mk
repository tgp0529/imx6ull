ALL_SRC_DIRS := $(shell find . -type d)
ALL_SRC_FILES := $(foreach dir, $(ALL_SRC_DIRS), $(wildcard $(dir)/*.c))
ALL_TARGET_OBJS := $(patsubst %.c, %.o, $(ALL_SRC_FILES))

ifeq ($(TARGER_TYPE), "exe")
MK_EXE := $(TARGET_DIR)/$(TARGET_NAME)
MK_TARGET := $(MK_EXE)
endif

# *.o生成规则
%.o:%.c
	$(MAKEFILE_V)$(CC) $(INCLUDE) $(CFLAGS) -o $@ -c $<

# exe生成规则
$(MK_EXE):$(ALL_TARGET_OBJS)
	$(MAKEFILE_V)$(CC) $(INCLUDE) $(CFLAGS) -o $@ $^ $(LDFLAGS)

all:
	$(MAKEFILE_V)make $(MK_TARGET)

clean:
	$(MAKEFILE_V)-rm -rf $(ALL_TARGET_OBJS) $(MK_TARGET)