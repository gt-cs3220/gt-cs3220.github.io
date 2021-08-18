; Addresses for I/O
.NAME	HEX= 0xFFFFF000
.NAME	LEDR=0xFFFFF020
.NAME	KEY= 0xFFFFF080
.NAME	SW=  0xFFFFF090

	; This should never be executed
	.ORG 0
	br		BadStartPC
	addi	s1,s1,0x1
	addi	s1,s1,0x1
	addi	s1,s1,0x1
	addi	s1,s1,0x1
	addi	s1,s1,0x1
	addi	s1,s1,0x1
	addi	s1,s1,0x1
	addi	s1,s1,0x1
BadStartPC:
	; Turn on LEDR, display 0xBAD on HEX
	andi	Zero,Zero,0
	not		t0,Zero
	sw		t0,LEDR(Zero)
	addi	Zero,t0,0xBAD
	sw		t0,HEX(sp)
	br		BadStartPC
	
	; Now the actual code
	.ORG 0x100
	; Check if the very first instruction is executed correctly
	addi	s2,s1,7531
	subi	s1,s1,7531
	beq		s1,s2,FirstInstWorks
BadFirstInst:
	xor 	zero,zero,zero
	sw		s2,HEX(zero)
	not		t0,zero
	sw		t0,LEDR(Zero)
	br		BadFirstInst
FirstInstWorks:
	; Our Zero and FP registers will be zero
	xor		fp,fp,fp
	add		Zero,fp,fp
	; Put 1 on LEDR
	addi	Zero,s0,1
	sw		s0,LEDR(fp)
	; Put 2 on LEDR should still be off
	addi	s0,s0,1
	sw		s0,LEDR(fp)
	addi	fp,t0,-1
	addi	fp,t1,2
	addi	fp,a0,1
	add		a1,t0,t1
	beq		a0,a1,AddWorks
AddFailed:
	; Display what's in a0
	not		t0,fp
	sw		a0,HEX(Zero)
	br		AddFailed
AddWorks:
	; Put 3 on LEDR should still be off
	addi	s0,s0,1
	sw		s0,LEDR(Zero)
	addi	fp,t0,7		; t0 is 7  (0x00000007)
	addi	t0,t1,3	    ; t1 is 10 (0x0000000A)
	add		a0,t1,t1    ; a0 is 20 (0x00000014)
	ori		a0,a1,0x25	; a1 is     0x00000035)
	andi	a1,a2,0xD1	; a2 is 17  0x00000011
	xor		a0,a0,a1	; a0 is 33  0x00000021
	or		a1,a0,t0	; a1 is     0x00000027
	nor		a2,t0,a2	; a2 is -2  0xFFFFFFFE
	nand	a3,a2,a1	; a3 is     0xFFFFFFD9
	sub		a1,t0,a2	; a1 is 9   0x00000009
	and		t0,a1,a2	; t0 is 8	0x00000008
	nxor	a1,a1,t0	; a1 is -2  0xFFFFFFFE
	xor		a2,a2,a3	; a3 is	    0x00000027
	sub		a0,a0,a2	; a0 is -6
	add		a0,a1,a0	; a0 is -8
	addi	fp,t1,-8
	bne		a0,t1,AluWorks
AluFailed:
	; Display what's in a0
	sw		a0,HEX(Zero)
	br		AluFailed
AluWorks:
	; Put 4 on LEDR
	addi	s0,s0,1
	sw		s0,LEDR(Zero)
	addi	fp,a1,1
	addi	fp,t0,75
	addi	fp,t1,34
	addi	fp,a0,-80
	le		a2,t0,t1
	bne		a2,fp,CmpFailed
	; Put 5 on LEDR
	addi	s0,s0,1
	sw		s0,LEDR(Zero)
	lt		a2,t0,t1
	bne		a2,fp,CmpFailed
	; Put 6 on LEDR
	addi	s0,s0,1
	sw		s0,LEDR(Zero)
	eq		a2,t0,t1
	bne		a2,fp,CmpFailed
	; Put 7 on LEDR
	addi	s0,s0,1
	sw		s0,LEDR(Zero)
	ne		a2,t0,t1
	bne		a2,a1,CmpFailed
	; Put 8 on LEDR
	addi	s0,s0,1
	sw		s0,LEDR(Zero)
	gt		a2,t0,t1
	bne		a2,a1,CmpFailed
	; Put 9 on LEDR
	addi	s0,s0,1
	sw		s0,LEDR(Zero)
	ge		a2,t0,t1
	bne		a2,a1,CmpFailed
	; Put 10 on LEDR
	addi	s0,s0,1
	sw		s0,LEDR(Zero)
	le		a2,t1,t1
	bne		a2,a1,CmpFailed
	; Put 11 on LEDR
	addi	s0,s0,1
	sw		s0,LEDR(Zero)
	lt		a2,t1,t1
	bne		a2,fp,CmpFailed
	; Put 12 on LEDR
	addi	s0,s0,1
	sw		s0,LEDR(Zero)
	eq		a2,t1,t1
	bne		a2,a1,CmpFailed
	; Put 13 on LEDR
	addi	s0,s0,1
	sw		s0,LEDR(Zero)
	ne		a2,t1,t1
	bne		a2,fp,CmpFailed
	; Put 14 on LEDR
	addi	s0,s0,1
	sw		s0,LEDR(Zero)
	gt		a2,t1,t1
	bne		a2,fp,CmpFailed
	; Put 15 on LEDR
	addi	s0,s0,1
	sw		s0,LEDR(Zero)
	ge		a2,t1,t1
	bne		a2,a1,CmpFailed
	; Put 16 on LEDR
	addi	s0,s0,1
	sw		s0,LEDR(Zero)
	le		a2,a0,t0
	bne		a2,a1,CmpFailed
	; Put 17 on LEDR
	addi	s0,s0,1
	sw		s0,LEDR(Zero)
	lt		a2,a0,t0
	bne		a2,a1,CmpFailed
	; Put 18 on LEDR
	addi	s0,s0,1
	sw		s0,LEDR(Zero)
	eq		a2,a0,t0
	bne		a2,fp,CmpFailed
	; Put 19 on LEDR
	addi	s0,s0,1
	sw		s0,LEDR(Zero)
	ne		a2,a0,t0
	bne		a2,a1,CmpFailed
	; Put 20 on LEDR
	addi	s0,s0,1
	sw		s0,LEDR(Zero)
	gt		a2,a0,t0
	bne		a2,fp,CmpFailed
	; Put 21 on LEDR
	addi	s0,s0,1
	sw		s0,LEDR(Zero)
	ge		a2,a0,t0
	bne		a2,fp,CmpFailed
	beq		t0,t0,CmpWorks
CmpFailed:
	; Display what's in a2
	sw		a2,HEX(Zero)
	br		CmpFailed
CmpWorks:
	; Put 22 on LEDR
	addi	s0,s0,1
	sw		s0,LEDR(Zero)
	addi	fp,t0,0x37
	addi	fp,t1,0xE1
	addi	fp,a2,1024
	sw		t0,0(a2)
	sw		t1,4(a2)
	addi	a2,a2,4
	lw		a0,0(a2)
	bne		a0,t1,MemFailed
	lw		a0,-4(a2)
	beq		a0,t0,MemWorks
MemFailed:
	; Display what's in a0
	sw		a0,HEX(Zero)
	br		MemFailed
MemWorks:
	; Put 23 on LEDR
	addi	s0,s0,1
	sw		s0,LEDR(sp)
	addi	fp,t1,JalRet
	jal		t0,JalTarg(fp)
JalRet:
	br		JalWorks
JalTarg:
	bne		t0,t1,JalFailed
	jal		t1,0(t0)
JalFailed:
	; Display what's in t0
	sw		t0,HEX(Zero)
	beq		t0,t0,JalFailed
JalWorks:
	; Put 24 on LEDR
	addi	s0,s0,1
	sw		s0,LEDR(sp)
WaitPress1:
	lw		t1,KEY(fp)
	sw		t1,HEX(fp)
	beq		t1,Zero,WaitPress1
WaitRelease1:
	lw		t1,KEY(fp)
	sw		t1,HEX(fp)
	bne		t1,fp,WaitRelease1
Done:
	; Turn on LEDR, put FFFFFF on HEX
	not		t0,fp
	sw		t0,LEDR(fp)
	sw		t0,HEX(Zero)
	beq		t0,t0,Done
