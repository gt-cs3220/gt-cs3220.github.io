addi x1,x0,0x300
 addi x2,x0, 0x177
 sw x2,0(x1)
 lb x4,0(x1) 
 andi x5, x2, 0xff
 add gp, x0, 2 
 bne x5, x4, fail 
 addi gp, x0, 1
 jal end  
 fail:
 addi gp, x0, 3
 end:
 nop