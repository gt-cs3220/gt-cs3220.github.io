# See LICENSE for license details.

#*****************************************************************************
# srai.S
#-----------------------------------------------------------------------------
#
# Test srai instruction.
#

#include "riscv_test.h"
#include "test_macros.h"


RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_IMM_OP( 2,  srai, 0xc0000000, 0x80000000, 1  );
  TEST_IMM_OP( 3,  srai, 0xffffffff, 0x80000001, 31 );

  #-------------------------------------------------------------
  # Source/Destination tests
  #-------------------------------------------------------------

  TEST_IMM_SRC1_EQ_DEST( 4, srai, 0x0ff000000, 0x80000000, 7 );

  #-------------------------------------------------------------
  # Bypassing tests
  #-------------------------------------------------------------

  TEST_IMM_DEST_BYPASS( 5, 0, srai, 0xff000000, 0x80000000, 7  );
  TEST_IMM_SRC1_BYPASS( 6, 0, srai, 0xff000000, 0x80000000, 7 )
  TEST_IMM_ZEROSRC1( 7, srai, 0, 4 );
  TEST_IMM_ZERODEST( 8, srai, 33, 10 );

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
