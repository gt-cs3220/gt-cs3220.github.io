# See LICENSE for license details.

#*****************************************************************************
# sltiu.S
#-----------------------------------------------------------------------------
#
# Test sltiu instruction.
#

#include "riscv_test.h"
#include "test_macros.h"


RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_IMM_OP( 2, sltiu, 1, 0x00000000, 0xfff );
  TEST_IMM_OP( 3, sltiu, 0, 0xffffffff, 0x001 );
  TEST_IMM_OP( 4, sltiu, 0, 0xffffffff, 0xfff );

  #-------------------------------------------------------------
  # Source/Destination tests
  #-------------------------------------------------------------

  TEST_IMM_SRC1_EQ_DEST( 5, sltiu, 1, 11, 13 );

  #-------------------------------------------------------------
  # Bypassing tests
  #-------------------------------------------------------------

  TEST_IMM_DEST_BYPASS( 6, 0, sltiu, 0, 15, 10 );
  TEST_IMM_SRC1_BYPASS( 7, 2, sltiu, 1, 12, 14 );
  TEST_IMM_ZEROSRC1( 8, sltiu, 1, 0xfff );
  TEST_IMM_ZERODEST( 9, sltiu, 0x00ff00ff, 0xfff );

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
