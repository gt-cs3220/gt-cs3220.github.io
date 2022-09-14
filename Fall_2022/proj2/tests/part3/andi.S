# See LICENSE for license details.

#*****************************************************************************
# andi.S
#-----------------------------------------------------------------------------
#
# Test andi instruction.
#

#include "riscv_test.h"
#include "test_macros.h"


RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Logical tests
  #-------------------------------------------------------------

  TEST_IMM_OP( 2, andi, 0xff00ff00, 0xff00ff00, 0xf0f );

  #-------------------------------------------------------------
  # Source/Destination tests
  #-------------------------------------------------------------

  TEST_IMM_SRC1_EQ_DEST( 3, andi, 0x00000000, 0xff00ff00, 0x0f0 );

  #-------------------------------------------------------------
  # Bypassing tests
  #-------------------------------------------------------------

  TEST_IMM_DEST_BYPASS( 4,  0, andi, 0x00000700, 0x0ff00ff0, 0x70f );
  TEST_IMM_SRC1_BYPASS( 5, 1, andi, 0x000000f0, 0x00ff00ff, 0x0f0 );
  TEST_IMM_ZEROSRC1( 6, andi, 0, 0x0f0 );
  TEST_IMM_ZERODEST( 7, andi, 0x00ff00ff, 0x70f );

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
