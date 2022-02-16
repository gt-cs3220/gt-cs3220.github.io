OUTPUT_ARCH( "riscv" )
ENTRY(_start)

SECTIONS
{
  . = 0x00000200;
  .text.init : { *(.text.init) }
  . = ALIGN(0x0000);
  .tohost : { *(.tohost) }
  . = ALIGN(0x0000);
  .text = .;
  . = ALIGN(0x0000);
  .data = .;
  .bss : { *(.bss) }
  _end = .;
}

