# See LICENSE for license details.

#*****************************************************************************
# add.S
#-----------------------------------------------------------------------------
#
# Test add instruction.
#

#include "riscv_test.h"
#include "test_macros.h"


RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_RR_OP( 2, add, 0x00000002, 0x00000001, 0x00000001 );
  TEST_RR_OP( 3, add, 0x80007ffe, 0x7fffffff, 0x00007fff );
  TEST_RR_OP( 4, add, 0x80000000, 0x00000001, 0x7fffffff );

  #-------------------------------------------------------------
  # Source/Destination tests
  #-------------------------------------------------------------

  TEST_RR_SRC1_EQ_DEST( 5, add, 24, 13, 11 );
  TEST_RR_SRC2_EQ_DEST( 6, add, 25, 14, 11 );
  TEST_RR_SRC12_EQ_DEST( 7, add, 26, 13 );

  #-------------------------------------------------------------
  # Bypassing tests
  #-------------------------------------------------------------

  TEST_RR_DEST_BYPASS( 8, 0, add, 24, 13, 11 );
  TEST_RR_SRC12_BYPASS( 9, 2, 0, add, 26, 15, 11 );
  TEST_RR_SRC21_BYPASS( 10, 1, 1, add, 25, 14, 11 );
  TEST_RR_ZEROSRC1( 11, add, 15, 15 );
  TEST_RR_ZEROSRC2( 12, add, 32, 32 );
  TEST_RR_ZEROSRC12( 13, add, 0 );
  TEST_RR_ZERODEST( 14, add, 16, 30 );

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
