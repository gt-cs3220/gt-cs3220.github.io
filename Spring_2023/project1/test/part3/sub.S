# See LICENSE for license details.

#*****************************************************************************
# sub.S
#-----------------------------------------------------------------------------
#
# Test sub instruction.
#

#include "riscv_test.h"
#include "test_macros.h"


RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_RR_OP( 2,  sub, 0xfffffffc, 0x00000003, 0x00000007 );
  TEST_RR_OP( 3,  sub, 0x00008000, 0x00000000, 0xffff8000 );
  TEST_RR_OP( 4, sub, 0x00000000, 0xffffffff, 0xffffffff );

  #-------------------------------------------------------------
  # Source/Destination tests
  #-------------------------------------------------------------

  TEST_RR_SRC1_EQ_DEST( 5, sub, 2, 13, 11 );
  TEST_RR_SRC2_EQ_DEST( 6, sub, 3, 14, 11 );
  TEST_RR_SRC12_EQ_DEST( 7, sub, 0, 13 );

  #-------------------------------------------------------------
  # Bypassing tests
  #-------------------------------------------------------------

  TEST_RR_DEST_BYPASS( 8, 0, sub, 2, 13, 11 );
  TEST_RR_SRC12_BYPASS( 9, 0, 0, sub, 2, 13, 11 );
  TEST_RR_SRC21_BYPASS( 10, 0, 0, sub, 2, 13, 11 );
  TEST_RR_ZEROSRC1( 11, sub, 15, -15 );
  TEST_RR_ZEROSRC2( 12, sub, 32, 32 );
  TEST_RR_ZEROSRC12( 13, sub, 0 );
  TEST_RR_ZERODEST( 14, sub, 16, 30 );

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
