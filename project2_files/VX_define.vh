`ifndef VX_DEFINE
`define VX_DEFINE

  `define DBITS     32
  `define INSTSIZE  32'd4
  `define INSTBITS  32
  `define REGWORDS  32 
  `define REGNOBITS  5
  `define IMMBITS   16
  `define STARTPC   32'h200
  
  //Memory mapped IO
  `define ADDRLEDR  32'hFFFFF020
  `define ADDRKEY   32'hFFFFF080
  `define ADDRSW    32'hFFFFF090

  
// address space is m 0x00000000 to 0x000fffff
  // [NOTICE] please note that both imem and dmem use the SAME "IDMEMINITFILE".
  // you need to change this line to change which test file to read 
  `define IDMEMINITFILE  "test/tinyrv1/testall.hex"
 
  `define IMEMADDRBITS  16
  `define IMEMWORDBITS  2
  `define IMEMWORDS	  (1 << (`IMEMADDRBITS - `IMEMWORDBITS))
  `define DMEMADDRBITS  16
  `define DMEMWORDBITS  2
  `define DMEMWORDS	  (1 << (`DMEMADDRBITS - `DMEMWORDBITS))
   
  `define OPBITS   7
  `define F3BITS  3
  `define F7BITS  7 


  `define CSR_OPCODE 1110011 
  `define CSRR_FUNCT3 010
  `define CSRW_FUNCT3 001  

  `define ADD_OPCODE 0110011
  `define ADD_FUNCT3 000
  `define ADD_FUNCT7 0000000 
  `define SUB_OPCODE 0110011
  `define SUB_FUNCT3 000
  `define SUB_FUNCT7 0100000
  `define AND_OPCODE 0110011
  `define AND_FUNCT3 111
  `define AND_FUNCT7 0000000 
  `define OR_OPCODE  0110011
  `define OR_FUNCT3  110
  `define OR_FUNCT7  0000000 
  `define XOR_OPCODE 0110011
  `define XOR_FUNCT3 100
  `define XOR_FUNCT7 0000000 
  `define SLT_OPCODE 0110011
  `define SLT_FUNCT3 010 
  `define SLT_FUNCT7 0000000 
  `define SLTU_OPCODE 0110011
  `define SLTU_FUNCT3 011 
  `define SLTU_FUNCT7 0000000 

  `define SRA_OPCODE 0110011 
  `define SRA_FUNCT3 101 
  `define SRA_FUNCT7 0100000 
  `define SRL_OPCODE 0110011 
  `define SRL_FUNCT3  101
  `define SRL_FUNCT7  0000000 
  `define SLL_OPCODE 0110011 
  `define SLL_FUNCT3 001 
  `define SLL_FUNCT7  0000000  
  `define MUL_OPCODE 0110011 
  `define MUL_FUNCT3 000 
  `define MUL_FUNCT7  0000001   
  

  `define ADDI_OPCODE 0010011   
  `define ADDI_FUNCT3 000 
  `define ANDI_OPCODE 0010011 
  `define ANDI_FUNCT3  111
  `define ORI_OPCODE 0010011 
  `define ORI_FUNCT3 110 
  `define XORI_OPCODE 0010011  
  `define XORI_FUNCT3 100 
  `define SLTI_OPCODE 0010011  
  `define SLTI_FUNCT3  010 
  `define SLTIU_OPCODE 0010011 
  `define SLTIU_FUNCT3  011 

  `define SRAI_OPCODE  0010011  
  `define SRAI_FUNCT3   101 
  `define SRAI_FUNCT7  0100000 
  `define SRLI_OPCODE  0010011   
  `define SRLI_FUNCT3  101 
  `define SRLI_FUNCT7  0000000 

  `define SLLI_OPCODE 0010011
  `define SLLI_FUNCT3  001 
  `define SLLI_FUNCT7  0000000   
  `define LUI_OPCODE 0110111 

  `define AUIPIC_OPCODE  0010111  

  `define LW_OPCODE  0000011 
  `define LW_FUNCT3  010  
  `define SW_OPCODE 0100011 
  `define Sw_FUNCT3 010 

  `define JAL_OPCODE 1101111 
  `define JR_OPCODE  1100111  
  `define JR_FUNCT3 000
  `define JR_10MSB 000000000000    
  `define JALR_OPCODE 1100111    
  `define JALR_FUNCT3  000 

  `define BEQ_OPCODE 1100011  
  `define BEQ_FUNCT3 000
  `define BNE_OPCODE 1100011  
  `define BNE_FUNCT3 001  

  `define BLT_OPCODE 1100011 
  `define BLT_FUNCT3 100
  `define BGE_OPCODE 1100011  
  `define BGE_FUNCT3 101 
  `define BLTU_OPCODE 1100011
  `define BLTU_FUNCT3 110
  `define BGEU_OPCODE 1100011
  `define BGEU_FUNCT3 111 
 
  `define CSR_PROC2MNGR 0x7C0
  `define CSR_MNGR2PROC 0xFC0
  `define CSR_COREID 0xF14
  `define CSR_NUMCORES 0xFC1
  `define CSR_STATS_EN 0x7C1 


  `define HEXBITS   24
  `define LEDRBITS  10
  `define KEYBITS  4





/** please update the following define with your own values */ 

  
  `define FE_latch_WIDTH  (`INSTBITS+`DBITS+`DBITS+`BUS_CANARY_WIDTH)
  `define DE_latch_WIDTH  (`INSTBITS+`DBITS+`DBITS+`OPBITS+`F3BITS+ `F7BITS + `DBITS+`DBITS+`DBITS + 1 + 1 + 1 + 1 + 1+ `REGNOBITS + `BUS_CANARY_WIDTH)

  `define AGEX_latch_WIDTH  (`INSTBITS+`DBITS+`DBITS + `DBITS + 1 + 1 + 1 + `REGNOBITS + `BUS_CANARY_WIDTH)
  `define MEM_latch_WIDTH   (`INSTBITS+`DBITS+`DBITS +`DBITS + `DBITS + 1 + 1 + `REGNOBITS + `BUS_CANARY_WIDTH)

  `define from_DE_to_FE_WIDTH  1 
  `define from_AGEX_to_FE_WIDTH 4 
  `define from_MEM_to_FE_WIDTH 4
  `define from_WB_to_FE_WIDTH 4

  `define from_AGEX_to_DE_WIDTH 4 
  `define from_MEM_to_DE_WIDTH 4 
  `define from_WB_to_DE_WIDTH  4 

  `define from_MEM_to_AGEX_WIDTH  4 
  `define from_WB_to_AGEX_WIDTH  4 

  `define from_WB_to_MEM_WIDTH 4 

  `define BUS_CANARY_WIDTH 4 
  `define BUS_CANARY_VALUE 4'b1111 
`endif 
