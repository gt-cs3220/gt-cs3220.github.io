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
	# Addition without any data dependency
	#-------------------------------------------------------------

	TEST_RR_OP( 2, add, 10, 3, 7 );

	#-------------------------------------------------------------
	# Addition with data dependency
	#-------------------------------------------------------------

	TEST_RR_DEST_BYPASS( 3, 0, add, 100, 25, 75 );

	TEST_PASSFAIL

RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN

  	TEST_DATA

RVTEST_DATA_END
