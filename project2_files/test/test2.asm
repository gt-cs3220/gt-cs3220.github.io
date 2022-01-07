; addresses for I/O
.NAME	HEX= 0xFFFFF000
.NAME	LEDR=0xFFFFF020
.NAME	KEY= 0xFFFFF080
.NAME	SW=  0xFFFFF090

	; bad PC goes here
	.ORG 0x0
	br	BadPC
	
BadPC:
	; for bad PC, display BAD on HEX
	andi	zero,zero,0x0
	not 	t0,zero
	sw	t0,LEDR(zero)
	addi 	zero,t0,0xBAD
	sw 	t0,HEX(sp)
	br	BadPC

	; normal example display 1 on HEX
	.ORG 0x100
Done:
	addi	zero,s1,0x1
	addi	zero,s2,0x1
	addi	zero,s2,0x1
	addi	zero,s2,0x1
	sw	s1,HEX(zero) 
	br 	Done
