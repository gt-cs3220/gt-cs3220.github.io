//-----------------------------------------------------------------------
// gtcs3220: Macro hack to simplify code generation
//
// This file contains macros for a sequence of commonly used instructions
//-----------------------------------------------------------------------

#pragma once

#define _riscv_xlen 32

#define TESTNUM gp \

//-----------------------------------------------------------------------
// Initialization code
//-----------------------------------------------------------------------

#define INIT_XREG       \
    li x1, 0;   \
    li x2, 0; 	\
    li x3, 0; 	\
    li x4, 0; 	\
    li x5, 0; 	\
    li x6, 0;   \
    li x7, 0; 	\
    li x8, 0; 	\
    li x9, 0; 	\
    li x10, 0;	\
    li x11, 0;	\
    li x12, 0;	\
    li x13, 0;	\
    li x14, 0;	\
    li x15, 0;	\
    li x16, 0;	\
    li x17, 0;	\
    li x18, 0;	\
    li x19, 0;	\
    li x20, 0;	\
    li x21, 0;	\
    li x22, 0;	\
    li x23, 0;	\
    li x24, 0;	\
    li x25, 0;	\
    li x26, 0;	\
    li x27, 0;	\
    li x28, 0;	\
    li x29, 0;	\
    li x30, 0;	\
    li x31, 0;

#define RVTEST_CODE_BEGIN \
	.section .text; \
	.globl _start; \
_start: \
	INIT_XREG \

#define RVTEST_CODE_END \
end: \
        nop; \
        nop; \

//-----------------------------------------------------------------------
// Pass and fail code (assumes test num is in TESTNUM)
//-----------------------------------------------------------------------

#define RVTEST_PASS \
	li TESTNUM, 1; \
        nop; \
        nop; \
        nop; \
        nop

#define RVTEST_FAIL \
	li TESTNUM, 0; \
        nop; \
        nop; \
        nop; \
        nop; \
        j end

#define TEST_PASSFAIL \
        bne x0, TESTNUM, pass; \
fail: \
        RVTEST_FAIL; \
pass: \
        RVTEST_PASS

//-----------------------------------------------------------------------
// Data Section Macro
//-----------------------------------------------------------------------

#define TEST_DATA

#define RVTEST_DATA_BEGIN                                           \
	.pushsection .tohost,"aw",@progbits;                            \
	.align 6; .global tohost; tohost: .dword 0;                     \
	.align 6; .global fromhost; fromhost: .dword 0;                 \
	.popsection;                                                    \
	.align 4; .global begin_signature; begin_signature:

#define RVTEST_DATA_END .align 4; .global end_signature; end_signature:

//-----------------------------------------------------------------------