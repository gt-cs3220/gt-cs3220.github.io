li gp, 2
li t0, 0
auipc t1,0x0
addi t1, t1, 16
jalr t0, t1 
j fail 
li gp, 1 
j done 
fail: 
li gp, 0
done: 
nop 