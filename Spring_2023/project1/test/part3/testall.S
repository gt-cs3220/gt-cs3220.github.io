# See LICENSE for license details.

#*****************************************************************************
# testall.S
#-----------------------------------------------------------------------------

# TinyRV2
#
# TinyRV2 is suitable for executing simple C programs that do not use
# system calls.
#
# - ADD, ADDI, SUB, MUL
# - AND, ANDI, OR, ORI, XOR, XORI
# - SLT, SLTI, SLTU, SLTIU
# - SRA, SRAI, SRL, SRLI, SLL, SLLI
# - LUI, AUIPC
# - LW, SW
# - JAL, JALR
# - BEQ, BNE, BLT, BGE, BLTU, BGEU
# - CSRR, CSRW (proc2mngr, mngr2proc, stats_en, core_id, num_cores)
#

#include "riscv_test.h"
#include "test_macros.h"


RVTEST_CODE_BEGIN

	TEST_RR_OP	( 2, add, 10, 3, 7 );
	TEST_IMM_OP	( 3, addi, 0x800007fe, 0x7fffffff, 0x7ff );
	TEST_RR_OP	( 4,  sub, 0xfffffffc, 0x00000003, 0x00000007 );
	TEST_RR_OP	( 5, and, 0x0f000f00, 0xff00ff00, 0x0f0f0f0f );
	TEST_IMM_OP	( 6, andi, 0xff00ff00, 0xff00ff00, 0xf0f );
	TEST_RR_OP	( 7, or, 0xff0fff0f, 0xff00ff00, 0x0f0f0f0f );
  	TEST_IMM_OP	( 8, ori, 0xffffff0f, 0xff00ff00, 0xf0f );
  	TEST_RR_OP	( 9, xor, 0xf00ff00f, 0xff00ff00, 0x0f0f0f0f );
  	TEST_IMM_OP	( 10, xori, 0xf00ff0ff, 0xf00ff00f, 0x0f0 );
  	TEST_RR_OP	( 11, slt, 1, 0xffffffff, 0x00000001 );
  	TEST_IMM_OP	( 12,  slti, 0, 0x00000007, 0x003 );
  	TEST_RR_OP	( 13,  sltu, 1, 0x80000000, 0xffff8000 );
  	TEST_IMM_OP	( 14, sltiu, 0, 0xffffffff, 0x001 );
  	TEST_RR_OP	( 15, sra, 0x0001ffff, 0x7fffffff, 14 );
  	TEST_IMM_OP	( 16, srai, 0xffffffff, 0x80000001, 31 );
  	TEST_RR_OP	( 17, srl, 0x21212121, 0x21212121, 0xffffffc0 );
   	TEST_RR_OP	( 18,  sll, 0xfffffffe, 0xffffffff, 1  );
   	TEST_IMM_OP	( 19, slli, 0x42424242, 0x21212121, 1  );

	TEST_PASSFAIL

RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN

  	TEST_DATA

RVTEST_DATA_END
