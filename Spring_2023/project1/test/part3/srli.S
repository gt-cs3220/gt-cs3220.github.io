# See LICENSE for license details.

#*****************************************************************************
# srli.S
#-----------------------------------------------------------------------------
#
# Test srli instruction.
#

#include "riscv_test.h"
#include "test_macros.h"


RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

#define TEST_SRLI(n, v, a) \
  TEST_IMM_OP(n, srli, ((v) & ((1 << (__riscv_xlen-1) << 1) - 1)) >> (a), v, a)

  TEST_SRLI( 2,  0xffffffff80000000, 0  );
  TEST_SRLI( 3,  0xffffffffffffffff, 0  );
  TEST_SRLI( 4, 0x0000000021212121, 0  );

  #-------------------------------------------------------------
  # Source/Destination tests
  #-------------------------------------------------------------

  TEST_IMM_SRC1_EQ_DEST( 5, srli, 0x01000000, 0x80000000, 7 );

  #-------------------------------------------------------------
  # Bypassing tests
  #-------------------------------------------------------------

  TEST_IMM_DEST_BYPASS( 6, 0, srli, 0x01000000, 0x80000000, 7  );
  TEST_IMM_SRC1_BYPASS( 7, 0, srli, 0x01000000, 0x80000000, 7  );
  TEST_IMM_ZEROSRC1( 8, srli, 0, 4 );
  TEST_IMM_ZERODEST( 9, srli, 33, 10 );

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
