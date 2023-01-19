# See LICENSE for license details.

#*****************************************************************************
# bge.S
#-----------------------------------------------------------------------------
#
# Test bge instruction.
#

#include "riscv_test.h"
#include "test_macros.h"


RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Branch tests
  #-------------------------------------------------------------

  # Each test checks both forward and backward branches

  TEST_BR2_OP_TAKEN( 1, bge, -1, -1 );
  TEST_BR2_OP_NOTTAKEN( 2, bge, -2,  1 );

  #-------------------------------------------------------------
  # Bypassing tests
  #-------------------------------------------------------------

  TEST_BR2_SRC12_BYPASS( 3, 2, 0, bge, -1, 0 );

  #-------------------------------------------------------------
  # Test delay slot instructions not executed nor bypassed
  #-------------------------------------------------------------

  TEST_CASE( 4, x1, 3, \
    li  x1, 1; \
    bge x1, x0, 1f; \
    addi x1, x1, 1; \
    addi x1, x1, 1; \
    addi x1, x1, 1; \
    addi x1, x1, 1; \
1:  addi x1, x1, 1; \
    addi x1, x1, 1; \
  )

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
