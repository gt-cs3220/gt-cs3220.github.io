; Addresses for I/O
.NAME	HEX= 0xFFFFF000
.NAME	LEDR=0xFFFFF020
.NAME	KEY= 0xFFFFF080
.NAME	SW=  0xFFFFF090
    ; The stack is at the top of memory
.NAME	StkTop=65536
; Number of data elements and sorting 

.NAME   ItNum=20
.NAME   ItNum1=19
.NAME   ItMNUM=80  
.NAME   ItMNum1=72 
; The array starts at data address 0x040 ahd has 10 elements  
.NAME   Array=0x1100 

 ; -----------------------------------------------------------------

; Processor Initialization
	.ORG 0x100
   	XOR		Zero,Zero,Zero					 	; Put a zero in the Zero register ; 0x100
	sw 	zero,HEX(zero)				; turn off HEX; 0x104
    sw  zero, LEDR(zero)   ; turn off LEDR 000  ; 0x108 

; outer loop Init 
    ADDI  Zero, S1, 0  ; loop count   ; 0x10c
    ADDI  Zero, R11, ItMNum1;   ;0x110
OuterLoop: 
    ; Inner loop Init 
    ADDI  Zero, S2, 0  ; loop count  ; 0x114

InnerLoop: 
    ; memory addresses should be incremented by 4 .. 
    LW T0, Array(S2) ; 0x118
    ADDI S2, A0, 4    ; 0x11c  
    LW T1, Array(A0)   ; 0x120

    BGT T0, T1, SWAP  ;0x124
NOSWAP: 
    ADDI S2, S2, 4   ;0x128
    BNE S2, R11, InnerLoop  ; 0x12c
;; end of inner InnerLoop  

    ADDI  S1, S1, 4      ;0x130 
    BNE  S1, R11, OuterLoop ;0x134

;; beginning of the ending loop 

    ADDI Zero, S0, 15  ;0x138
    ; ADDI Zero, R11, 1  ;0x13c
    ; ANDI R11, T0, 255;  0x140  
    ; SW S0, LEDR(zero);  0x144 
    ;; SW T0, HEX(Zero)   ;0x148 ;; should be T0 
    ADDI  Zero, S1, ItNum  ; loop count   ;0x13c
    ADDI  Zero, S2,  0 ;   ; 0x140 
READVAL: 
    SW S1, LEDR(zero); 0x144
    LW T1, Array(S2) ;0x148
    ANDI T1, T0, 255;  0x14c  
    SW T0, HEX(Zero) ; 0x150 
    ADDI S2, S2, 4   ; 0x154
    ADDI  S1, S1, -1     ; 0x158
    BNE  S1, Zero, READVAL  ; 0x15c 
DONE: 
    SW S1, LEDR(zero); 0x160 
    br DONE; ; 0x164 



SWAP:
    SW T1, Array(S2) ; 0x168
    SW T0, Array(A0)  ; 0x16c
    JMP NOSWAP(Zero) ; 0x170


	
 ; Data Initialization 
	.ORG 0x1100
	
 .WORD 0x0010
 .WORD 0x0050
 .WORD 0x0012
 .WORD 0x0003
 .WORD 0x0302
 .WORD 0x3001
 .WORD 0x0330
 .WORD 0x4050
 .WORD 0x0485
 .WORD 0x5030
 .WORD 0x0550
 .WORD 0x0002
 .WORD 0x0001
 .WORD 0x0410
 .WORD 0x4050
 .WORD 0x0412
 .WORD 0x4003
 .WORD 0x4002
 .WORD 0x4001
 .WORD 0x0501
 .WORD 0x0330
 .WORD 0x0350
 .WORD 0x0385
 .WORD 0x5010
 .WORD 0x0550
 .WORD 0x0512
 .WORD 0x0503
 .WORD 0x0502
 .WORD 0x1050
 .WORD 0x0212
 .WORD 0x2003
 .WORD 0x0202
 .WORD 0x2001
 .WORD 0x0330
 .WORD 0x3050
 .WORD 0x0385
 .WORD 0x3010
 .WORD 0x0350
 .WORD 0x0312
 .WORD 0x3003
 .WORD 0x6085
 .WORD 0x6010
 .WORD 0x0650
 .WORD 0x0612
 .WORD 0x0603
 .WORD 0x6002
 .WORD 0x6001
 .WORD 0x0630
 .WORD 0x0650
 .WORD 0x6085
 

	
