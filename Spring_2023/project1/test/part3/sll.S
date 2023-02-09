# See LICENSE for license details.

#*****************************************************************************
# sll.S
#-----------------------------------------------------------------------------
#
# Test sll instruction.
#

#include "riscv_test.h"
#include "test_macros.h"


RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_RR_OP( 2,  sll, 0x80000000, 0x00000001, 31 );
  TEST_RR_OP( 3,  sll, 0xfffffffe, 0xffffffff, 1  );

  # Verify that shifts only use bottom six(rv64) or five(rv32) bits

  TEST_RR_OP( 4, sll, 0x42424242, 0x21212121, 0xffffffc1 );

  #-------------------------------------------------------------
  # Source/Destination tests
  #-------------------------------------------------------------

  TEST_RR_SRC1_EQ_DEST( 5, sll, 0x00000080, 0x00000001, 7  );
  TEST_RR_SRC2_EQ_DEST( 6, sll, 0x00004000, 0x00000001, 14 );
  TEST_RR_SRC12_EQ_DEST( 7, sll, 24, 3 );

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
