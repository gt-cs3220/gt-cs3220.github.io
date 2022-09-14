# See LICENSE for license details.

#*****************************************************************************
# sltu.S
#-----------------------------------------------------------------------------
#
# Test sltu instruction.
#

#include "riscv_test.h"
#include "test_macros.h"


RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_RR_OP( 2,  sltu, 1, 0x00000000, 0xffff8000 );
  TEST_RR_OP( 3,  sltu, 0, 0x80000000, 0x00000000 );
  TEST_RR_OP( 4,  sltu, 1, 0x80000000, 0xffff8000 );

  #-------------------------------------------------------------
  # Source/Destination tests
  #-------------------------------------------------------------

  TEST_RR_SRC1_EQ_DEST( 5, sltu, 0, 14, 13 );
  TEST_RR_SRC2_EQ_DEST( 6, sltu, 1, 11, 13 );
  TEST_RR_SRC12_EQ_DEST( 7, sltu, 0, 13 );

  #-------------------------------------------------------------
  # Bypassing tests
  #-------------------------------------------------------------


  TEST_RR_DEST_BYPASS( 8, 1, sltu, 0, 14, 13 );
  TEST_RR_SRC12_BYPASS( 9, 0, 0, sltu, 0, 14, 13 );
  TEST_RR_SRC21_BYPASS( 10, 2, 0, sltu, 1,  6, 13 );
  TEST_RR_ZEROSRC1( 11, sltu, 1, -1 );
  TEST_RR_ZEROSRC2( 12, sltu, 0, -1 );
  TEST_RR_ZEROSRC12( 13, sltu, 0 );
  TEST_RR_ZERODEST( 14, sltu, 16, 30 );

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
