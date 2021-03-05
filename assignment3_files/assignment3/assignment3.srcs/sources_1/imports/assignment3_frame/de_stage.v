 `include "VX_define.vh" 


module DE_STAGE(
  input clk,
  input reset,
  input [`FE_latch_WIDTH-1:0] from_FE_latch,
  input [`from_AGEX_to_DE_WIDTH-1:0] from_AGEX_to_DE,  
  input [`from_MEM_to_DE_WIDTH-1:0] from_MEM_to_DE,     
  input [`from_WB_to_DE_WIDTH-1:0] from_WB_to_DE,  
  output [`from_DE_to_FE_WIDTH-1:0] from_DE_to_FE,   
  output[`DE_latch_WIDTH-1:0] DE_latch_out
);

/* pipeline latch*/ 
 reg [`DE_latch_WIDTH-1:0] DE_latch; 

  /* register file */ 
  reg [`DBITS-1:0] regs [`REGWORDS-1:0];
  
 /* decode signals */
  
  wire [`INSTBITS-1:0] inst_DE; 
  wire [`DBITS-1:0] PC_DE;
  wire [`DBITS-1:0] pcplus_DE; 
  wire [`OP1BITS-1:0] op1_DE;
  wire [`OP2BITS-1:0] op2_DE;
  wire [`IMMBITS-1:0] imm_DE;
  wire [`REGNOBITS-1:0] rd_DE;
  wire [`REGNOBITS-1:0] rs_DE;
  wire [`REGNOBITS-1:0] rt_DE;
  
  wire signed [`DBITS-1:0] regval1_DE;
  wire signed [`DBITS-1:0] regval2_DE;
  wire signed [`DBITS-1:0] sxt_imm_DE;


  wire is_br_DE;
  wire is_jmp_DE;
  wire rd_mem_DE;
  wire wr_mem_DE;
  wire wr_reg_DE;
  wire [`REGNOBITS-1:0] wregno_DE;
  
  wire wr_reg_WB;
  wire [`REGNOBITS-1:0] wregno_WB;
  wire [`DBITS-1:0] regval_WB;
  
  wire[`DE_latch_WIDTH-1:0] DE_latch_contents; 
  wire[`BUS_CANARY_WIDTH-1:0] bus_canary_DE; 
 // **TODO: Complete the rest of the pipeline 

// extracting a part of opcode 
  assign op1_DE = inst_DE[31:26];  // example code 

 // complete the rest of instruction decoding
  assign op2_DE = inst_DE[25:18];
  assign imm_DE = inst_DE[23:8];
  assign rd_DE = inst_DE[11:8];
  assign rs_DE = inst_DE[7:4];
  assign rt_DE = inst_DE[3:0];
  
  assign is_br_DE = (op1_DE == `OP1_BEQ) || (op1_DE == `OP1_BLT) || (op1_DE == `OP1_BLE) || (op1_DE == `OP1_BNE);
  assign is_jmp_DE = op1_DE == `OP1_JAL;
  assign rd_mem_DE = op1_DE == `OP1_LW;
  assign wr_mem_DE = op1_DE == `OP1_SW;
  assign wr_reg_DE = (op1_DE == `OP1_ALUR) || rd_mem_DE || (op1_DE[`OP1BITS-1] == 1);
  
// set regval1_DE and regval2_DE to rs and rt
  assign regval1_DE = regs[rs_DE];
  assign regval2_DE = regs[rt_DE];
  
//  reg [`REGNOBITS-1:0] wregno_DE_REG;
//  reg [`REGNOBITS-1:0] wregno_EX_REG;
//  reg [`REGNOBITS-1:0] wregno_MEM_REG;
//  reg [`INSTBITS-1:0] inst_DE_REG;

// assign wire to send the contents of DE latch to other pipeline stages  
  assign DE_latch_out = DE_latch; 
  
  // Stalling Logic
//  wire rs_eval = rs_DE != 0 && (wregno_DE_REG == rs_DE || wregno_EX_REG == rs_DE || wregno_MEM_REG == rs_DE);
//  wire rt_eval = rt_DE != 0 && (wregno_DE_REG == rt_DE || wregno_DE_REG == rt_DE || wregno_MEM_REG == rt_DE);
  
//  wire DE_stall = wregno_DE_REG != 0 && (wregno_DE_REG == rs_DE || wregno_DE_REG == rt_DE);
//  wire EX_stall = wregno_EX_REG != 0 && (wregno_EX_REG == rs_DE || wregno_EX_REG == rt_DE);
//  wire MEM_stall = wregno_MEM_REG != 0 && (wregno_MEM_REG == rs_DE || wregno_MEM_REG == rt_DE);
  
//  assign stall_pipe = (DE_stall || EX_stall || MEM_stall) && (
//  ((rs_eval || rt_eval) && (op1_DE[5:3] == 3'b000 || op1_DE[5:2] == 4'b0010)) ||
//  (rs_eval && (op1_DE[5:2] == 4'b0011 || op1_DE[5:3] == 3'b010 || op1_DE[5:3] == 3'b100)));
  
  assign stall_pipe = (from_AGEX_to_DE) || is_br_DE;
  assign from_DE_to_FE = {
    stall_pipe
  };
  
  
  assign wregno_DE = (op1_DE[5:3] == 3'b000) ? rd_DE : rt_DE;

    // Sign extension example 
  SXT mysxt (.IN(imm_DE), .OUT(sxt_imm_DE));
  


// decoding the contents of FE latch out. the order should be matched with the fe_stage.v 
  assign {
            inst_DE,
            PC_DE, 
            pcplus_DE,
            bus_canary_DE 
            }  = from_FE_latch;  // based on the contents of the latch, you can decode the content 

// decoding contents of signals from WB
    assign {
            wr_reg_WB,
            wregno_WB,
            regval_WB
            } = from_WB_to_DE;

    assign DE_latch_contents = {
                                  inst_DE,
                                  PC_DE,
                                  pcplus_DE,
                                  op1_DE,
                                  op2_DE,
                                  regval1_DE,
                                  regval2_DE,
                                  sxt_imm_DE,
                                  is_br_DE,
                                  is_jmp_DE,
                                  rd_mem_DE,
                                  wr_mem_DE,
                                  wr_reg_DE,
                                  wregno_DE,

                                  // more signals might need
                                   bus_canary_DE 
                                  }; 
    
  always @ (negedge clk or posedge reset) begin
    if(reset) begin
	  	regs[0] <= {`DBITS{1'b0}};
	  	regs[1] <= {`DBITS{1'b0}};
	   	regs[2] <= {`DBITS{1'b0}};
		  regs[3] <= {`DBITS{1'b0}};
	  	regs[4] <= {`DBITS{1'b0}};
		  regs[5] <= {`DBITS{1'b0}};
		  regs[6] <= {`DBITS{1'b0}};
		  regs[7] <= {`DBITS{1'b0}};
		  regs[8] <= {`DBITS{1'b0}};
		  regs[9] <= {`DBITS{1'b0}};
		  regs[10] <= {`DBITS{1'b0}};
		  regs[11] <= {`DBITS{1'b0}};
		  regs[12] <= {`DBITS{1'b0}};
		  regs[13] <= {`DBITS{1'b0}};
		  regs[14] <= {`DBITS{1'b0}};
		  regs[15] <= {`DBITS{1'b0}};
	 end 
   // need to complete register write 
    // else if ... 
    else if (wr_reg_WB && wregno_WB) begin
        regs[wregno_WB] <= regval_WB;
    end
  end

  always @ (posedge clk or posedge reset) begin
    if(reset || from_AGEX_to_DE) begin
      DE_latch <= {`DE_latch_WIDTH{1'b0}};
      // might need more code 
      end
     else
     // need to complete. e.g.) stall? 
      DE_latch <= DE_latch_contents;
  end

endmodule




module SXT(IN, OUT);
  parameter IBITS = 16;
  parameter OBITS = 32;

  input  [IBITS-1:0] IN;
  output [OBITS-1:0] OUT;

  assign OUT = {{(OBITS-IBITS){IN[IBITS-1]}}, IN};
endmodule

