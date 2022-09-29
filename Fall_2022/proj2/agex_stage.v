 `include "define.vh" 

module AGEX_STAGE(
  input  wire                               clk,
  input  wire                               reset,
  input  wire [`from_MEM_to_AGEX_WIDTH-1:0] from_MEM_to_AGEX,    
  input  wire [`from_WB_to_AGEX_WIDTH-1:0]  from_WB_to_AGEX,   
  input  wire [`DE_latch_WIDTH-1:0]         from_DE_latch,
  output wire [`AGEX_latch_WIDTH-1:0]       AGEX_latch_out,
  output wire [`from_AGEX_to_FE_WIDTH-1:0]  from_AGEX_to_FE,
  output wire [`from_AGEX_to_DE_WIDTH-1:0]  from_AGEX_to_DE
);

  reg [`AGEX_latch_WIDTH-1:0] AGEX_latch; 
  // wire to send the AGEX latch contents to other pipeline stages 
  assign AGEX_latch_out = AGEX_latch;
  
  wire[`AGEX_latch_WIDTH-1:0] AGEX_latch_contents; 
  
   
  wire [`INSTBITS-1:0] inst_AGEX; 
  wire [`DBITS-1:0] PC_AGEX;
  wire [`DBITS-1:0] inst_count_AGEX; 
  wire [`DBITS-1:0] pcplus_AGEX; 
  wire [`IOPBITS-1:0] op_I_AGEX;
  reg br_cond_AGEX; // 1 means a branch condition is satisified. 0 means a branch condition is not satisifed 

  wire [`REGWORDS-1:0] regword_1;
  wire [`REGWORDS-1:0] regword_2;
  wire [`REGWORDS-1:0] regword_3;

  wire[`BUS_CANARY_WIDTH-1:0] bus_canary_AGEX; 
 
  // **TODO: Complete the rest of the pipeline 
  wire signed [`REGWORDS-1:0] s_regword_1 = regword_1;
  wire signed [`REGWORDS-1:0] s_regword_2 = regword_2;
  wire signed [`REGWORDS-1:0] s_regword_3 = regword_3;
  
  always @ (*) begin
    case (op_I_AGEX)
      `BEQ_I : 
        if (regword_1 == regword_2)
          br_cond_AGEX = 1;  
        else
          br_cond_AGEX = 0;  
      `BNE_I :
        if (regword_1 != regword_2)
          br_cond_AGEX = 1;   
        else
          br_cond_AGEX = 0;
      `BLT_I : 
        if (s_regword_1 < s_regword_2)
          br_cond_AGEX = 1;  
        else
          br_cond_AGEX = 0;  
      `BGE_I : 
        if (s_regword_1 >= s_regword_2)
          br_cond_AGEX = 1;   
        else
          br_cond_AGEX = 0; 
      `BLTU_I: 
        if (regword_1 < regword_2)
          br_cond_AGEX = 1;  
        else
          br_cond_AGEX = 0;  
      `BGEU_I : 
        if (regword_1 >= regword_2)
          br_cond_AGEX = 1;    
        else
          br_cond_AGEX = 0;
      `JAL_I:
        br_cond_AGEX = 1;
      `JALR_I:
        br_cond_AGEX = 1;
      default : br_cond_AGEX = 0;
    endcase
  end

  // compute ALU operations  (alu out or memory addresses)

  reg [`REGWORDS-1:0] result;
  always @ (*) begin
    case (op_I_AGEX)
      `ADD_I: 
        result = regword_1 + regword_2;
      `ADDI_I:
        result = regword_1 + regword_2;
      `SUB_I:
        result = regword_1 - regword_2;
      `LUI_I:
        result = regword_2;
      `AUIPC_I:
        result = PC_AGEX + regword_2;
      `JAL_I:
        result = PC_AGEX + 4;
      `JALR_I:
        result = PC_AGEX + 4;
      default:
        result = 0;
    endcase 
  end 

  // branch target needs to be computed here 
  // computed branch target needs to send to other pipeline stages (pctarget_AGEX)

  reg [`DBITS-1:0] target;
  always @(*)begin  
    if (op_I_AGEX == `BEQ_I || op_I_AGEX == `BNE_I || op_I_AGEX == `BLT_I || op_I_AGEX == `BGE_I || op_I_AGEX == `BLTU_I || op_I_AGEX == `BGEU_I || op_I_AGEX == `JAL_I)
      target = PC_AGEX + regword_3;
    if (op_I_AGEX == `JALR_I)
      target = (regword_1 + regword_2) & 32'hFFFFFFFE;

  end 

  assign from_AGEX_to_FE = {br_cond_AGEX, target};

  assign from_AGEX_to_DE = br_cond_AGEX;

  assign  {
    inst_AGEX,
    PC_AGEX,
    pcplus_AGEX,
    op_I_AGEX,
    inst_count_AGEX, 
            // more signals might need
    regword_1,
    regword_2,
    regword_3,
    bus_canary_AGEX
  } = from_DE_latch;    
 
  assign AGEX_latch_contents = {
    inst_AGEX,
    PC_AGEX,
    op_I_AGEX,
    inst_count_AGEX, 
            // more signals might need
    result,
    bus_canary_AGEX     
  }; 
 
  always @ (posedge clk) begin
    if (reset) begin
      AGEX_latch <= {`AGEX_latch_WIDTH{1'b0}};
      // might need more code here  
        end 
    else 
        begin
      // need to complete 
            AGEX_latch <= AGEX_latch_contents ;
        end 
  end

endmodule
