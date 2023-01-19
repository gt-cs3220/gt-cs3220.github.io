# See LICENSE for license details.

#*****************************************************************************
# slti.S
#-----------------------------------------------------------------------------
#
# Test slti instruction.
#

#include "riscv_test.h"
#include "test_macros.h"


RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_IMM_OP( 2,  slti, 0, 0x00000007, 0x003 );
  TEST_IMM_OP( 3,  slti, 0, 0x00000000, 0x800 );

  #-------------------------------------------------------------
  # Source/Destination tests
  #-------------------------------------------------------------

  TEST_IMM_SRC1_EQ_DEST( 4, slti, 1, 11, 13 );

  #-------------------------------------------------------------
  # Bypassing tests
  #-------------------------------------------------------------

  TEST_IMM_DEST_BYPASS( 5, 0, slti, 0, 15, 10 );
  TEST_IMM_SRC1_BYPASS( 6, 2, slti, 1, 12, 14 );
  TEST_IMM_ZEROSRC1( 7, slti, 0, 0xfff );
  TEST_IMM_ZERODEST( 8, slti, 0x00ff00ff, 0xfff );

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
