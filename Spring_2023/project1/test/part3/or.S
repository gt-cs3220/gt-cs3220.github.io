# See LICENSE for license details.

#*****************************************************************************
# or.S
#-----------------------------------------------------------------------------
#
# Test or instruction.
#

#include "riscv_test.h"
#include "test_macros.h"


RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Logical tests
  #-------------------------------------------------------------

  TEST_RR_OP( 2, or, 0xff0fff0f, 0xff00ff00, 0x0f0f0f0f );

  #-------------------------------------------------------------
  # Source/Destination tests
  #-------------------------------------------------------------

  TEST_RR_SRC1_EQ_DEST( 3, or, 0xff0fff0f, 0xff00ff00, 0x0f0f0f0f );
  TEST_RR_SRC2_EQ_DEST( 4, or, 0xff0fff0f, 0xff00ff00, 0x0f0f0f0f );
  TEST_RR_SRC12_EQ_DEST( 5, or, 0xff00ff00, 0xff00ff00 );

  #-------------------------------------------------------------
  # Bypassing tests
  #-------------------------------------------------------------

  TEST_RR_DEST_BYPASS( 6,  0, or, 0xff0fff0f, 0xff00ff00, 0x0f0f0f0f );
  TEST_RR_SRC12_BYPASS( 7, 0, 0, or, 0xff0fff0f, 0xff00ff00, 0x0f0f0f0f );
  TEST_RR_SRC21_BYPASS( 8, 0, 0, or, 0xff0fff0f, 0xff00ff00, 0x0f0f0f0f );
  TEST_RR_ZERODEST( 9, or, 0x11111111, 0x22222222 );

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
