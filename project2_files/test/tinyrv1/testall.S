//-----------------------------------------
// gt-cs3220: test cases for the TinyRV1 ISA
//-----------------------------------------

.section .text
.globl _start

_start:

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
    add     a0, ra, sp
    addi    t0, zero, 10
    bne     a0, t0, fail

// Addition with data dependency
test3:
    addi    ra, zero, 5
    addi    sp, zero, 10
    addi    t0, zero, 15
    add     a0, ra, sp
    add     a1, a0, t2
    addi    t1, zero, 30
    bne     a1, t1, fail

// Jump Register (JALR)
test4:
    addi    a0, zero, 40
    auipc   t1, 0x0
    addi    t1, t1, 16
    jalr    t1, x0
    addi    a0, zero, 50
    addi    t0, zero, 40
    bne     a0, t0, fail

// Jump and Link (JAL): PC relative 
test5:
    jal     ra, 16

fail:
    addi    gp, zero, 0
    addi    t0, zero, 1
    bne     zero, t0, end

pass:
    addi    gp, zero, 1

end:
    nop



