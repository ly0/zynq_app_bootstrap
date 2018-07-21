# Auto Generated by Xilinx generate_app. Modify at your own risk

CC := arm-none-eabi-gcc
CC_FLAGS := -MMD -MP       -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard 
CFLAGS := 
LN_FLAGS := -DFSBL_DEBUG_INFO -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -Wl,-build-id=none -specs=Xilinx.spec  -lrsa -Wl,--start-group,-lxil,-lgcc,-lc,--end-group -Wl,--start-group,-lxilffs,-lxil,-lgcc,-lc,--end-group -Wl,--start-group,-lrsa,-lxil,-lgcc,-lc,--end-group  -Wl,--gc-sections 

c_SOURCES := $(wildcard *.c)
S_SOURCES := $(wildcard *.S)
s_SOURCES := $(wildcard *.s)
INCLUDES := $(wildcard *.h)
OBJS := $(patsubst %.c, %.o, $(c_SOURCES))
OBJS += $(patsubst %.S, %.o, $(S_SOURCES))
OBJS += $(patsubst %.s, %.o, $(s_SOURCES))
LSCRIPT := -Tlscript.ld

CURRENT_DIR = $(shell pwd)
DEPFILES := $(patsubst %.o, %.d, $(OBJS))
LIBS := zynq_bsp/ps7_cortexa9_0/lib/libxil.a
EXEC := executable.elf

INCLUDEPATH := -Izynq_bsp/ps7_cortexa9_0/include -I.
LIBPATH := -Lzynq_bsp/ps7_cortexa9_0/lib -L./

all: $(EXEC)

$(EXEC): $(LIBS) $(OBJS) $(INCLUDES)
	$(CC) -o $@ $(OBJS) $(CC_FLAGS) $(CFLAGS) $(LN_FLAGS) $(LIBPATH) $(LSCRIPT)

$(LIBS):
	$(MAKE) -C zynq_bsp

%.o:%.c
	$(CC) $(CC_FLAGS) $(CFLAGS) -c $< -o $@ $(INCLUDEPATH)

%.o:%.S
	$(CC) $(CC_FLAGS) $(CFLAGS) -c $< -o $@ $(INCLUDEPATH)

%.o:%.s
	$(CC) $(CC_FLAGS) $(CFLAGS) -c $< -o $@ $(INCLUDEPATH)

clean:
	rm -rf $(OBJS) $(LIBS) $(EXEC) *.o

-include $(DEPFILES)
