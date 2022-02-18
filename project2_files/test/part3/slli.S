# See LICENSE for license details.

#*****************************************************************************
# slli.S
#-----------------------------------------------------------------------------
#
# Test slli instruction.
#

#include "riscv_test.h"
#include "test_macros.h"


RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_IMM_OP( 2,  slli, 0x80000000, 0x00000001, 31 );
  TEST_IMM_OP( 3,  slli, 0xffffff80, 0xffffffff, 7  );
  TEST_IMM_OP( 4, slli, 0x42424242, 0x21212121, 1  );

  #-------------------------------------------------------------
  # Source/Destination tests
  #-------------------------------------------------------------

  TEST_IMM_SRC1_EQ_DEST( 5, slli, 0x00000080, 0x00000001, 7 );

  #-------------------------------------------------------------
  # Bypassing tests
  #-------------------------------------------------------------

  TEST_IMM_DEST_BYPASS( 6, 0, slli, 0x00000080, 0x00000001, 7  );
  TEST_IMM_SRC1_BYPASS( 7, 1, slli, 0x00004000, 0x00000001, 14 );
  TEST_IMM_ZEROSRC1( 8, slli, 0, 31 );
  TEST_IMM_ZERODEST( 9, slli, 33, 20 );

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
