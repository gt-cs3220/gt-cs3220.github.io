#------------------------------------------------------
# gt-cs3220: Makefile for building TinyRV test cases
#------------------------------------------------------

src_dir = .
incs += -I$(src_dir)

RISCV           ?= /opt/riscv-gnu-toolchain
RISCV_PREFIX    ?= $(RISCV)/bin/riscv32-unknown-elf-
RISCV_GCC       ?= $(RISCV_PREFIX)gcc
RISCV_GCC_OPTS  ?= -DPREALLOCATE=0 -mcmodel=medany -std=gnu99 -O2 -ffast-math -fno-common -fno-builtin-printf
RISCV_LINK      ?= $(RISCV_GCC) -T $(src_dir)/link.ld $(incs)
RISCV_LINK_OPTS ?= -static -nostdlib -nostartfiles -lm -lgcc
RISCV_OBJDUMP   ?= $(RISCV_PREFIX)objdump --disassemble-all --disassemble-zeroes --section=.text --section=.text.startup --section=.text.init --section=.data --section=.comment
RISCV_OBJCOPY   ?= $(RISCV_PREFIX)objcopy --output-target=verilog --verilog-data-width=4 --reverse-bytes=4
VMHTOMEM         = python ../vmhtomem.py

PROJECT = towers
SRCS = $(PROJECT).c crt.S
OBJS = $(addsuffix .o, $(SRCS))

.PHONY: clean

default: all

all: $(PROJECT).dump $(PROJECT).mem $(PROJECT).elf

%.c.o : %.c
	$(RISCV_GCC) $(incs) $(RISCV_GCC_OPTS) -c $^ -o $@

%.S.o : %.S
	$(RISCV_GCC) $(incs) $(RISCV_GCC_OPTS) -c $^ -o $@

$(PROJECT).elf: $(OBJS)
	$(RISCV_LINK) $(RISCV_LINK_OPTS) $^ -o $@ 

$(PROJECT).dump: $(PROJECT).elf
	$(RISCV_OBJDUMP) $< > $@

$(PROJECT).mem: $(PROJECT).elf
	$(RISCV_OBJCOPY) $< $@
	$(VMHTOMEM) $@

clean:
	$(RM) -v *.elf *.dump *.mem *.dec *.o

#------------------------------------------------------
