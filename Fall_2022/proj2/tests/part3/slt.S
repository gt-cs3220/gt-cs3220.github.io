# See LICENSE for license details.

#*****************************************************************************
# slt.S
#-----------------------------------------------------------------------------
#
# Test slt instruction.
#

#include "riscv_test.h"
#include "test_macros.h"


RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_RR_OP( 2, slt, 0, 0x00000000, 0xffffffff );
  TEST_RR_OP( 3, slt, 1, 0xffffffff, 0x00000001 );
  TEST_RR_OP( 4, slt, 0, 0xffffffff, 0xffffffff );

  #-------------------------------------------------------------
  # Source/Destination tests
  #-------------------------------------------------------------

  TEST_RR_SRC1_EQ_DEST( 5, slt, 0, 14, 13 );
  TEST_RR_SRC2_EQ_DEST( 6, slt, 1, 11, 13 );
  TEST_RR_SRC12_EQ_DEST( 7, slt, 0, 13 );

  #-------------------------------------------------------------
  # Bypassing tests
  #-------------------------------------------------------------

  TEST_RR_DEST_BYPASS( 8, 2, slt, 1, 12, 13 );
  TEST_RR_SRC12_BYPASS( 9, 0, 0, slt, 0, 14, 13 );
  TEST_RR_SRC21_BYPASS( 10, 2, 0, slt, 1,  6, 13 );
  TEST_RR_ZEROSRC1( 11, slt, 0, -1 );
  TEST_RR_ZEROSRC2( 12, slt, 1, -1 );
  TEST_RR_ZEROSRC12( 13, slt, 0 );
  TEST_RR_ZERODEST( 14, slt, 16, 30 );

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
