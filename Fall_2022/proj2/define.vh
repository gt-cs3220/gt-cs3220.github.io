`ifndef DEFINE_H
`define DEFINE_H

`define DBITS     32
`define INSTSIZE  32'd4
`define INSTBITS  32
`define REGWORDS  32 
`define REGNOBITS  5
`define STARTPC   32'h200

// Memory mapped IO
`define ADDRLEDR  32'hFFFFF020
`define ADDRKEY   32'hFFFFF080
`define ADDRSW    32'hFFFFF090

// address space is m 0x00000000 to 0x000fffff
// [NOTICE] please note that both imem and dmem use the SAME "IDMEMINITFILE".
// you need to change this line to change which test file to read 
`define IDMEMINITFILE "tests/part1/test1.mem"
`define IMEMADDRBITS  16
`define IMEMWORDBITS  2
`define IMEMWORDS	  (1 << (`IMEMADDRBITS - `IMEMWORDBITS))
`define DMEMADDRBITS  16
`define DMEMWORDBITS  2
`define DMEMWORDS	  (1 << (`DMEMADDRBITS - `DMEMWORDBITS))

`define CSRNOBITS 4
`define CSR_ID_BIT_MASK 12'hF // this should match with CSRNOBITS 
`define CSRREGNUM (1 << (`CSRNOBITS))

// internal instruction opcode enumerator for easy programming 

`define IOPBITS 6
`define TYPENOBITS 4 
`define IMMTYPENOBITS 3 

`define ADD_I    1 
`define SUB_I    2 
`define AND_I    3
`define OR_I     4 
`define XOR_I    5
`define SLT_I    6
`define SLTU_I   7
`define SRA_I    8
`define SRL_I    9
`define SLL_I    10
`define MUL_I    11
`define ADDI_I   12 
`define ANDI_I   13
`define ORI_I    14
`define XORI_I   15
`define SLTI_I   16
`define SLTIU_I  17
`define SRAI_I   18
`define SRLI_I   19
`define SLLI_I   20
`define LUI_I    21
`define AUIPC_I  22
`define LW_I     23
`define SW_I     24
`define JAL_I    25
`define JR_I     26
`define JALR_I   27
`define BEQ_I    28
`define BNE_I    29
`define BLT_I    30
`define BGE_I    31
`define BLTU_I   32
`define BGEU_I   33
`define CSRR_I  34
`define CSRW_I  35
`define CSR_I    36
`define INVALID_I 37 

`define R_Type 1 
`define I_Type 2 
`define S_Type 3 
`define U_Type 4 
`define I_I_type 5 
`define S_I_Type 6
`define B_I_Type 7
`define U_I_Type 8
`define J_I_Type 9 

`define I_immediate 1 
`define J_immediate 2
`define U_immediate 3
`define S_immediate 4 
`define B_immediate 5  

`define CSRR_OPCODE 7'b1110011 
`define CSRR_FUNCT3 3'b010
`define CSRW_OPCODE 7'b1110011 
`define CSRW_FUNCT3 3'b001  

`define ADD_OPCODE 7'b0110011
`define ADD_FUNCT3 3'b000
`define ADD_FUNCT7 7'b0000000 
`define SUB_OPCODE 7'b0110011
`define SUB_FUNCT3 3'b000
`define SUB_FUNCT7 7'b0100000
`define AND_OPCODE 7'b0110011
`define AND_FUNCT3 3'b111
`define AND_FUNCT7 7'b0000000 
`define OR_OPCODE  7'b0110011
`define OR_FUNCT3  3'b110
`define OR_FUNCT7  7'b0000000 
`define XOR_OPCODE 7'b0110011
`define XOR_FUNCT3 3'b100
`define XOR_FUNCT7 7'b0000000 
`define SLT_OPCODE 7'b0110011
`define SLT_FUNCT3 3'b010 
`define SLT_FUNCT7 7'b0000000 
`define SLTU_OPCODE 7'b0110011
`define SLTU_FUNCT3 3'b011 
`define SLTU_FUNCT7 7'b0000000 

`define SRA_OPCODE 7'b0110011 
`define SRA_FUNCT3 3'b101 
`define SRA_FUNCT7 7'b0100000 
`define SRL_OPCODE 7'b0110011 
`define SRL_FUNCT3  3'b101
`define SRL_FUNCT7  7'b0000000 
`define SLL_OPCODE  7'b0110011 
`define SLL_FUNCT3  3'b001
`define SLL_FUNCT7  7'b0000000 
`define MUL_OPCODE 7'b0110011 
`define MUL_FUNCT3 3'b000 
`define MUL_FUNCT7  7'b0000001   


`define ADDI_OPCODE 7'b0010011   
`define ADDI_FUNCT3 3'b000 
`define ANDI_OPCODE 7'b0010011 
`define ANDI_FUNCT3 3'b111
`define ORI_OPCODE 7'b0010011 
`define ORI_FUNCT3 3'b110 
`define XORI_OPCODE 7'b0010011  
`define XORI_FUNCT3 3'b100 
`define SLTI_OPCODE 7'b0010011  
`define SLTI_FUNCT3  3'b010 
`define SLTIU_OPCODE 7'b0010011 
`define SLTIU_FUNCT3  3'b011 

`define SRAI_OPCODE  7'b0010011  
`define SRAI_FUNCT3   3'b101 
`define SRAI_FUNCT7  7'b0100000 
`define SRLI_OPCODE  7'b0010011   
`define SRLI_FUNCT3  3'b101 
`define SRLI_FUNCT7  7'b0000000 

`define SLLI_OPCODE 7'b0010011
`define SLLI_FUNCT3  3'b001 
`define SLLI_FUNCT7  7'b0000000   
`define LUI_OPCODE 7'b0110111 

`define AUIPC_OPCODE  7'b0010111  

`define LW_OPCODE  7'b0000011 
`define LW_FUNCT3  3'b010  
`define SW_OPCODE 7'b0100011 
`define SW_FUNCT3 3'b010 

`define JAL_OPCODE 7'b1101111 
`define JR_OPCODE  7'b1100111  
`define JR_FUNCT3 3'b000
`define JR_10MSB 10'b000000000000    
`define JALR_OPCODE 7'b1100111    
`define JALR_FUNCT3  3'b000 

`define BEQ_OPCODE 7'b1100011  
`define BEQ_FUNCT3 3'b000
`define BNE_OPCODE 7'b1100011  
`define BNE_FUNCT3 3'b001  

`define BLT_OPCODE 7'b1100011 
`define BLT_FUNCT3 3'b100
`define BGE_OPCODE 7'b1100011  
`define BGE_FUNCT3 3'b101 
`define BLTU_OPCODE 7'b1100011
`define BLTU_FUNCT3 3'b110
`define BGEU_OPCODE 7'b1100011
`define BGEU_FUNCT3 3'b111 

`define CSR_PROC2MNGR 0x7C0
`define CSR_MNGR2PROC 0xFC0
`define CSR_COREID 0xF14
`define CSR_NUMCORES 0xFC1
`define CSR_STATS_EN 0x7C1 

/** please update the following define with your own values */ 

`define FE_latch_WIDTH  (`INSTBITS+`DBITS+`DBITS+ `DBITS+ `BUS_CANARY_WIDTH)
`define DE_latch_WIDTH  (`INSTBITS+`DBITS+`DBITS+ `IOPBITS + `DBITS+ `BUS_CANARY_WIDTH)

`define AGEX_latch_WIDTH   (`INSTBITS+`DBITS+ `IOPBITS + `DBITS+ `BUS_CANARY_WIDTH)
`define MEM_latch_WIDTH    (`INSTBITS+`DBITS+ `IOPBITS + `DBITS+  `BUS_CANARY_WIDTH) 

`define from_DE_to_FE_WIDTH  1 
`define from_AGEX_to_FE_WIDTH 1
`define from_MEM_to_FE_WIDTH 1
`define from_WB_to_FE_WIDTH 1

`define from_AGEX_to_DE_WIDTH 1 
`define from_MEM_to_DE_WIDTH  1 
`define from_WB_to_DE_WIDTH  (1 + `REGNOBITS + `DBITS + `CSRNOBITS + 1) 

`define from_MEM_to_AGEX_WIDTH  1
`define from_WB_to_AGEX_WIDTH  1

`define from_WB_to_MEM_WIDTH 1

`define BUS_CANARY_WIDTH 4 
`define BUS_CANARY_VALUE 4'b1111 
  
`endif 
