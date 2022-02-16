# See LICENSE for license details.

#*****************************************************************************
# addi.S
#-----------------------------------------------------------------------------
#
# Test addi instruction.
#

#include "riscv_test.h"
#include "test_macros.h"


RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_IMM_OP( 2, addi, 0x0000000a, 0x00000003, 0x007 );
  TEST_IMM_OP( 3, addi, 0x800007fe, 0x7fffffff, 0x7ff );
  TEST_IMM_OP( 4, addi, 0x80000000, 0x7fffffff, 0x001 );
  
  #-------------------------------------------------------------
  # Bypassing tests
  #-------------------------------------------------------------

  TEST_IMM_DEST_BYPASS( 5, 2, addi, 22, 13,  9 );
  TEST_IMM_SRC1_BYPASS( 6, 0, addi, 24, 13, 11 );
  TEST_IMM_ZEROSRC1( 7, addi, 32, 32 );
  TEST_IMM_ZERODEST( 8, addi, 33, 50 );

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
