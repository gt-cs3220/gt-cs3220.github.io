#-----------------------------------------
# gt-cs3220: Makefile for building TinyRV1 test cases
#-----------------------------------------

RISCV_TOOLCHAIN_PATH ?= /opt/riscv-gnu-toolchain
RISCV_PREFIX ?= $(RISCV_TOOLCHAIN_PATH)/bin/riscv32-unknown-elf-
RISCV_GCC ?= $(RISCV_PREFIX)gcc
RISCV_GCC_OPTS ?= -static -mcmodel=medlow -fvisibility=hidden -nostdlib -nostartfiles -T ./link.ld
RISCV_OBJDUMP ?= $(RISCV_PREFIX)objdump --disassemble-all --disassemble-zeroes --section=.text --section=.text.startup --section=.text.init --section=.data
ELF2HEX ?= ./freedom-elf2hex/bin/elf2hex --bit-width 32 

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
	$(ELF2HEX) --input $< --output $@

clean:
	$(RM) *.elf *.dump *.hex