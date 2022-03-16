addi x1,x0,0x300
 addi x2,x0, 0x1bc
 sw x2,0(x1)
 lb x4,0(x1) 
 andi x5, x2, 0xff
 addi x7, x0, 16 
 sll x5, x5, x7 
 slli x5, x5, 4 
 slli x5, x5, 4 
 sra x5, x5, x7
 srai x5, x5, 4  
srai x5, x5, 4  
 add gp, x0, 2 
 bne x5, x4, fail 
 addi gp, x0, 1
 jal end  
 fail:
 addi gp, x0, 3
 end:
 nop