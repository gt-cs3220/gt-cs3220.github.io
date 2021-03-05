`ifndef VX_DEFINE
`define VX_DEFINE

  `define DBITS     32
  `define INSTSIZE  32'd4
  `define INSTBITS  32
  `define REGNOBITS  4
  `define REGWORDS  (1 << `REGNOBITS)
  `define IMMBITS   16
  `define STARTPC   32'h100
  
  //Memory mapped IO
  `define ADDRHEX   32'hFFFFF000
  `define ADDRLEDR  32'hFFFFF020
  `define ADDRKEY   32'hFFFFF080
  `define ADDRSW    32'hFFFFF090

  

  // [NOTICE] please note that both imem and dmem use the SAME "IDMEMINITFILE".
  // you need to change this line to change which test file to read 
  `define IDMEMINITFILE  "test1.mem"
 

 
  
  `define IMEMADDRBITS  16
  `define IMEMWORDBITS  2
  `define IMEMWORDS	  (1 << (`IMEMADDRBITS - `IMEMWORDBITS))
  `define DMEMADDRBITS  16
  `define DMEMWORDBITS  2
  `define DMEMWORDS	  (1 << (`DMEMADDRBITS - `DMEMWORDBITS))
   
  `define OP1BITS   6
  `define OP1_ALUR  6'b000000
  `define OP1_BEQ   6'b001000
  `define OP1_BLT   6'b001001
  `define OP1_BLE   6'b001010
  `define OP1_BNE   6'b001011
  `define OP1_JAL   6'b001100
  `define OP1_LW    6'b010010
  `define OP1_SW    6'b011010
  `define OP1_ADDI  6'b100000
  `define OP1_ANDI  6'b100100
  `define OP1_ORI   6'b100101
  `define OP1_XORI  6'b100110
  
  // Add `defines for secondary opcode values 
  /* OP2 */
  `define OP2BITS   8
  `define OP2_EQ    8'b00001000
  `define OP2_LT    8'b00001001
  `define OP2_LE    8'b00001010
  `define OP2_NE    8'b00001011
  `define OP2_ADD   8'b00100000
  `define OP2_AND   8'b00100100
  `define OP2_OR    8'b00100101
  `define OP2_XOR   8'b00100110
  `define OP2_SUB   8'b00101000
  `define OP2_NAND  8'b00101100
  `define OP2_NOR   8'b00101101
  `define OP2_NXOR  8'b00101110
  `define OP2_RSHF  8'b00110000
  `define OP2_LSHF  8'b00110001
  
  
  `define HEXBITS   24
  `define LEDRBITS  10
  `define KEYBITS  4





/** please update the following define with your own values */ 

  
  `define FE_latch_WIDTH  (`INSTBITS+`DBITS+`DBITS+`BUS_CANARY_WIDTH)
  `define DE_latch_WIDTH  (`INSTBITS+`DBITS+`DBITS+`OP1BITS+`OP2BITS+`DBITS+`DBITS+`DBITS + 1 + 1 + 1 + 1 + 1+ `REGNOBITS + `BUS_CANARY_WIDTH)

  `define AGEX_latch_WIDTH  (`INSTBITS+`DBITS+`DBITS + `DBITS + 1 + 1 + 1 + `REGNOBITS + `BUS_CANARY_WIDTH)
  `define MEM_latch_WIDTH   (`INSTBITS+`DBITS+`DBITS +`DBITS + `DBITS + 1 + 1 + `REGNOBITS + `BUS_CANARY_WIDTH)

  `define from_DE_to_FE_WIDTH  1 
  `define from_AGEX_to_FE_WIDTH (1 + `INSTBITS) // bit for br_cond 
  `define from_MEM_to_FE_WIDTH 4
  `define from_WB_to_FE_WIDTH 4

  `define from_AGEX_to_DE_WIDTH 1 // if br_cond, flush pipeline
  `define from_MEM_to_DE_WIDTH 4 
  `define from_WB_to_DE_WIDTH  (1 + `REGNOBITS + `DBITS)

  `define from_MEM_to_AGEX_WIDTH  4 
  `define from_WB_to_AGEX_WIDTH  4 

  `define from_WB_to_MEM_WIDTH 4 

  `define BUS_CANARY_WIDTH 4 
  `define BUS_CANARY_VALUE 4'b1111 
`endif 