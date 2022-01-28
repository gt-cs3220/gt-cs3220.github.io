#-----------------------------------------
# gt-cs3220: Makefile for building TinyRV1 test cases
#-----------------------------------------

RISCV ?= /opt/riscv-gnu-toolchain
RISCV_PREFIX ?= $(RISCV)/bin/riscv32-unknown-elf-
RISCV_GCC ?= $(RISCV_PREFIX)gcc
RISCV_GCC_OPTS ?= -static -mcmodel=medlow -fvisibility=hidden -nostdlib -nostartfiles -T ./link.ld
RISCV_OBJDUMP ?= $(RISCV_PREFIX)objdump --disassemble-all --disassemble-zeroes --section=.text --section=.text.startup --section=.text.init --section=.data
RISCV_OBJCOPY ?= $(RISCV_PREFIX)objcopy --output-target=verilog --adjust-start=0x200 --verilog-data-width=4 --reverse-bytes=4

# define riscv assembly source files
SRCS = testall.S

# define name of executable
TARGET = testall

.PHONY: clean

default: all

all: $(TARGET).elf $(TARGET).dump $(TARGET).hex

$(TARGET).elf: $(SRCS)
	$(RISCV_GCC) $(RISCV_GCC_OPTS) $(SRCS) -o $@

$(TARGET).dump: $(TARGET).elf
	$(RISCV_OBJDUMP) $< > $@

$(TARGET).hex: $(TARGET).elf
	$(RISCV_OBJCOPY) $< $@

clean:
	$(RM) *.elf *.dump *.hex