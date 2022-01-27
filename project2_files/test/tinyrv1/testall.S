//-----------------------------------------
// gt-cs3220: test cases for the TinyRV1 ISA
//-----------------------------------------

.section data

.section .text
.globl _start

_start:
    jal     ra, test1

// Load, Store, and Branch
test1:
    addi    sp, zero, 0x14
    addi    a0, zero, 8
    sw      a0, 4(sp)
    lw      a1, 4(sp)
    bne     a0, a1, fail

// Addition without any data dependecy
test2:
    addi    ra, zero, 3
    addi    sp, zero, 7
    add     a4, ra, sp
    addi    t2, zero, 10
    bne     a4, t2, fail

// Addition with data dependency
test3:
    addi    ra, zero, 12
    addi    sp, zero, 34
    addi    t2, zero, 56
    add     a4, ra, sp
    add     a5, a4, t2
    addi    t3, zero, 102
    bne     a5, t3, fail

// Jump
fail:
    addi    gp, zero, 0
    jal     zero, end
    addi    gp, zero, 2

pass:
    addi    gp, zero, 1

end:
    nop



