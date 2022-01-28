OUTPUT_ARCH( "riscv" )
ENTRY(_start)

SECTIONS
{
  . = 0x00000200;
  .text.init : { *(.text.init) }
  . = ALIGN(0x0000);
  .tohost : { *(.tohost) }
  . = ALIGN(0x0000);
  .text : { *(.text) }
  . = ALIGN(0x0000);
  .data : { *(.data) }
  .bss : { *(.bss) }
  _end = .;
}

