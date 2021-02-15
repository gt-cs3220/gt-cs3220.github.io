; addresses for I/O
.NAME	HEX= 0xFFFFF000
.NAME	LEDR=0xFFFFF020
.NAME	KEY= 0xFFFFF080
.NAME	SW=  0xFFFFF090

.NAME   DATA=0x1000

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
	addi	zero,s1,0x0
	add	s1,s1,s1
	addi 	s1,s1,0x1
	sw	s1,HEX(zero)	; pass the first data hazard

	lw	s2,DATA(zero)
	add	s2,s2,s1
	addi	s1,s1,0x0
	sw	s1,HEX(zero)	; pass the second data hazard, display 1
	br 	Done
