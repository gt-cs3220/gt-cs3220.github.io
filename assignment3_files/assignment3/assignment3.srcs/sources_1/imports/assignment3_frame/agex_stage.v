 `include "VX_define.vh" 


module AGEX_STAGE(
  input clk,
  input reset,
  input [`from_MEM_to_AGEX_WIDTH-1:0] from_MEM_to_AGEX,    
  input [`from_WB_to_AGEX_WIDTH-1:0] from_WB_to_AGEX,   
  input [`DE_latch_WIDTH-1:0] from_DE_latch,
  output[`AGEX_latch_WIDTH-1:0] AGEX_latch_out,
  output[`from_AGEX_to_FE_WIDTH-1:0] from_AGEX_to_FE,
  output[`from_AGEX_to_DE_WIDTH-1:0] from_AGEX_to_DE
);

  reg [`AGEX_latch_WIDTH-1:0] AGEX_latch; 
  // wire to send the AGEX latch contents to other pipeline stages 
  assign AGEX_latch_out = AGEX_latch;
  
  wire[`AGEX_latch_WIDTH-1:0] AGEX_latch_contents; 
  
   
  wire [`INSTBITS-1:0]inst_AGEX; 
  wire [`DBITS-1:0]PC_AGEX;
  wire [`DBITS-1:0]pcplus_AGEX; 
  wire [`OP1BITS-1:0] op1_AGEX;
  wire [`OP2BITS-1:0] op2_AGEX;
  wire [`IMMBITS-1:0] imm_AGEX;

  
  wire signed [`DBITS-1:0] regval1_AGEX;
  wire signed [`DBITS-1:0] regval2_AGEX;
  wire signed [`DBITS-1:0] sxt_imm_AGEX;

  wire is_br_AGEX;
  wire is_jmp_AGEX;
  wire rd_mem_AGEX;
  wire wr_mem_AGEX;
  wire wr_reg_AGEX;
  wire [`REGNOBITS-1:0] wregno_AGEX;
  
  reg br_cond_AGEX;
  reg [`DBITS-1:0] aluout_AGEX; 
  
  wire[`DBITS-1:0] pctarget_AGEX; 
  
    wire[`BUS_CANARY_WIDTH-1:0] bus_canary_AGEX; 
 // **TODO: Complete the rest of the pipeline 
 
  
  always @ (op1_AGEX or regval1_AGEX or regval2_AGEX) begin
    case (op1_AGEX)
      `OP1_BEQ : br_cond_AGEX = (regval1_AGEX == regval2_AGEX);
      `OP1_BLT : br_cond_AGEX = (regval1_AGEX < regval2_AGEX);
      `OP1_BLE : br_cond_AGEX = (regval1_AGEX <= regval2_AGEX);
      `OP1_BNE : br_cond_AGEX = (regval1_AGEX != regval2_AGEX);
      default : br_cond_AGEX = 1'b0;
    endcase
  end

  always @ (op1_AGEX or op2_AGEX or regval1_AGEX or regval2_AGEX or sxt_imm_AGEX) begin
    if(op1_AGEX == `OP1_ALUR)
      case (op2_AGEX)
			`OP2_EQ	 : aluout_AGEX = {31'b0, regval1_AGEX == regval2_AGEX};
			`OP2_LT	 : aluout_AGEX = {31'b0, regval1_AGEX < regval2_AGEX};
			`OP2_LE  : aluout_AGEX = {31'b0, regval1_AGEX <= regval2_AGEX};
			`OP2_NE  : aluout_AGEX = {31'b0, regval1_AGEX != regval2_AGEX};
			`OP2_ADD : aluout_AGEX = regval1_AGEX + regval2_AGEX;
			`OP2_AND : aluout_AGEX = regval1_AGEX & regval2_AGEX;
			`OP2_OR  : aluout_AGEX = regval1_AGEX | regval2_AGEX;
			`OP2_XOR : aluout_AGEX = regval1_AGEX ^ regval2_AGEX;
			`OP2_SUB : aluout_AGEX = regval1_AGEX - regval2_AGEX;
			`OP2_NAND: aluout_AGEX = ~(regval1_AGEX & regval2_AGEX);
			`OP2_NOR : aluout_AGEX = ~(regval1_AGEX | regval2_AGEX);
			`OP2_NXOR: aluout_AGEX = ~(regval1_AGEX ^ regval2_AGEX);
			`OP2_RSHF: aluout_AGEX = regval1_AGEX >>> regval2_AGEX; // >>>/<<< is signed
			`OP2_LSHF: aluout_AGEX = regval1_AGEX <<< regval2_AGEX;
			default	 : aluout_AGEX = {`DBITS{1'b0}};
		endcase
	 else if(op1_AGEX == `OP1_LW || op1_AGEX == `OP1_SW || op1_AGEX == `OP1_ADDI)
		aluout_AGEX= regval1_AGEX + sxt_imm_AGEX;
	 else if(op1_AGEX == `OP1_ANDI)
		aluout_AGEX = regval1_AGEX & sxt_imm_AGEX;
	 else if(op1_AGEX == `OP1_ORI)
		aluout_AGEX = regval1_AGEX | sxt_imm_AGEX;
	 else if(op1_AGEX == `OP1_XORI)
		aluout_AGEX = regval1_AGEX ^ sxt_imm_AGEX;
     else if(op1_AGEX == `OP1_JAL)
        aluout_AGEX = PC_AGEX;
	 else
		aluout_AGEX = {`DBITS{1'b0}};
	 end

// branch target needs to be computed here
assign pctarget_AGEX = (sxt_imm_AGEX < 0) ? (PC_AGEX - (1 <<< -sxt_imm_AGEX)): (PC_AGEX + (1 <<< sxt_imm_AGEX));

// computed branch target needs to send to other pipeline stages

assign from_AGEX_to_FE = {
                                br_cond_AGEX,
                                pctarget_AGEX
                                };
                                
assign from_AGEX_to_DE = br_cond_AGEX;

    assign  {
                                  inst_AGEX,
                                  PC_AGEX,
                                  pcplus_AGEX,
                                  op1_AGEX,
                                  op2_AGEX,

                                  regval1_AGEX,
                                  regval2_AGEX,
                                  sxt_imm_AGEX,                                
                                  is_br_AGEX,
                                  is_jmp_AGEX,
                                  rd_mem_AGEX,
                                  wr_mem_AGEX,
                                  wr_reg_AGEX,
                                  wregno_AGEX, 
                                          // more signals might need
                                  bus_canary_AGEX
                                  } = from_DE_latch; 
    
 
  assign AGEX_latch_contents = {
                                inst_AGEX,
                                PC_AGEX,
                                aluout_AGEX,
                                regval2_AGEX,
                                rd_mem_AGEX,
                                wr_mem_AGEX,
                                wr_reg_AGEX,
                                wregno_AGEX,
                                       // more signals might need
                                bus_canary_AGEX     
                                 }; 
 
  always @ (posedge clk or posedge reset) begin
    if(reset) begin
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