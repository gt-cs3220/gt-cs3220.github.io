`include "define.vh" 


module DE_STAGE(
  input wire clk,
  input wire reset,
  input wire [`FE_latch_WIDTH-1:0] from_FE_latch,
  input wire [`from_AGEX_to_DE_WIDTH-1:0] from_AGEX_to_DE,  
  input wire [`from_MEM_to_DE_WIDTH-1:0] from_MEM_to_DE,     
  input wire [`from_WB_to_DE_WIDTH-1:0] from_WB_to_DE,  
  output wire [`from_DE_to_FE_WIDTH-1:0] from_DE_to_FE,   
  output wire [`DE_latch_WIDTH-1:0] DE_latch_out
);


  /* pipeline latch*/ 
  reg [`DE_latch_WIDTH-1:0] DE_latch; 


  /* architecture register file */ 
  reg [`DBITS-1:0] regs [`REGWORDS-1:0];
  reg [`REGWORDS-1:0] busy_bits;
  
  /* decode signals */
  wire valid_DE;
  wire [`INSTBITS-1:0] inst_DE; 
  wire [`DBITS-1:0] PC_DE;
  wire [`DBITS-1:0] pcplus_DE; 
  wire [`DBITS-1:0] inst_count_DE; 
  wire[`DE_latch_WIDTH-1:0] DE_latch_contents; 

 

// extracting a part of opcode 
  wire [2:0] F3_DE; 
  wire [6:0] F7_DE; 
  wire [6:0] op_DE; 

  assign op_DE = inst_DE[6:0];  
  assign F3_DE = inst_DE[14:12];
  assign F7_DE = inst_DE[31:25];  
 
  /* opcode decoding logic */ 
  reg [`IOPBITS-1:0 ] op_I_DE; //  internal opcode enumerator for easy programming.  
  reg [`TYPENOBITS-1:0] type_I_DE;  // instruction format type information for decoding purpose 
  reg [`IMMTYPENOBITS-1:0] type_immediate_DE;  // immediate type information for decodding purpose 

  always @(*) begin 
    if ((op_DE == `ADD_OPCODE) && (F3_DE == `ADD_FUNCT3) && (F7_DE == `ADD_FUNCT7))
      op_I_DE = `ADD_I; 
    else if ((op_DE == `SUB_OPCODE) && (F3_DE == `SUB_FUNCT3) && (F7_DE == `SUB_FUNCT7))
      op_I_DE = `SUB_I; 
    else if ((op_DE == `AND_OPCODE) && (F3_DE == `AND_FUNCT3) && (F7_DE == `AND_FUNCT7))
      op_I_DE = `AND_I; 
    else if ((op_DE == `OR_OPCODE) && (F3_DE == `OR_FUNCT3) && (F7_DE == `OR_FUNCT7))
      op_I_DE = `OR_I; 
    else if ((op_DE == `XOR_OPCODE) && (F3_DE == `XOR_FUNCT3) && (F7_DE == `XOR_FUNCT7))
      op_I_DE = `XOR_I; 
    else if ((op_DE == `SLT_OPCODE) && (F3_DE == `SLT_FUNCT3) && (F7_DE == `SLT_FUNCT7))
      op_I_DE = `SLT_I; 
    else if ((op_DE == `SLTU_OPCODE) && (F3_DE == `SLTU_FUNCT3) && (F7_DE == `SLTU_FUNCT7))
      op_I_DE = `SLTU_I; 
    else if ((op_DE == `SRA_OPCODE) && (F3_DE == `SRA_FUNCT3) && (F7_DE == `SRA_FUNCT7))
      op_I_DE = `SRA_I; 
    else if ((op_DE == `SRL_OPCODE) && (F3_DE == `SRL_FUNCT3) && (F7_DE == `SRL_FUNCT7))
      op_I_DE = `SRL_I; 
    else if ((op_DE == `SLL_OPCODE) && (F3_DE == `SLL_FUNCT3) && (F7_DE == `SLL_FUNCT7))
      op_I_DE = `SLL_I; 
    else if ((op_DE == `MUL_OPCODE) && (F3_DE == `MUL_FUNCT3) && (F7_DE == `MUL_FUNCT7))
      op_I_DE = `MUL_I; 
    else if ((op_DE == `ADDI_OPCODE) && (F3_DE == `ADDI_FUNCT3))
      op_I_DE = `ADDI_I; 
    else if ((op_DE == `ANDI_OPCODE) && (F3_DE == `ANDI_FUNCT3))
      op_I_DE = `ANDI_I; 
    else if ((op_DE == `ORI_OPCODE) && (F3_DE == `ORI_FUNCT3))
      op_I_DE = `ORI_I; 
    else if ((op_DE == `XORI_OPCODE) && (F3_DE == `XORI_FUNCT3))
      op_I_DE = `XORI_I; 
    else if ((op_DE == `SLTI_OPCODE) && (F3_DE == `SLTI_FUNCT3))
      op_I_DE = `SLTI_I; 
    else if ((op_DE == `SLTIU_OPCODE) && (F3_DE == `SLTIU_FUNCT3))
      op_I_DE = `SLTIU_I; 
    else if ((op_DE == `SRAI_OPCODE) && (F3_DE == `SRAI_FUNCT3) && (F7_DE == `SRAI_FUNCT7))
      op_I_DE = `SRAI_I; 
    else if ((op_DE == `SRLI_OPCODE) && (F3_DE == `SRLI_FUNCT3) && (F7_DE == `SRLI_FUNCT7))
      op_I_DE = `SRLI_I; 
    else if ((op_DE == `SLLI_OPCODE) && (F3_DE == `SLLI_FUNCT3) && (F7_DE == `SLLI_FUNCT7))
      op_I_DE = `SLLI_I; 
    else if ((op_DE == `LUI_OPCODE))
      op_I_DE = `LUI_I; 
    else if ((op_DE == `AUIPC_OPCODE))
      op_I_DE = `AUIPC_I; 
    else if ((op_DE == `LW_OPCODE) && (F3_DE == `LW_FUNCT3))
      op_I_DE = `LW_I; 
    else if ((op_DE == `SW_OPCODE) && (F3_DE == `SW_FUNCT3))
      op_I_DE = `SW_I; 
    else if ((op_DE == `JAL_OPCODE))
      op_I_DE = `JAL_I; 
    else if ((op_DE == `JALR_OPCODE) && (F3_DE == `JALR_FUNCT3))
      op_I_DE = `JALR_I; 
    else if ((op_DE == `BEQ_OPCODE) && (F3_DE == `BEQ_FUNCT3))
      op_I_DE = `BEQ_I; 
    else if ((op_DE == `BNE_OPCODE) && (F3_DE == `BNE_FUNCT3))
      op_I_DE = `BNE_I; 
    else if ((op_DE == `BLT_OPCODE) && (F3_DE == `BLT_FUNCT3))
      op_I_DE = `BLT_I; 
    else if ((op_DE == `BGE_OPCODE) && (F3_DE == `BGE_FUNCT3))
      op_I_DE = `BGE_I; 
    else if ((op_DE == `BLTU_OPCODE) && (F3_DE == `BLTU_FUNCT3))
      op_I_DE = `BLTU_I; 
    else if ((op_DE == `BGEU_OPCODE) && (F3_DE == `BGEU_FUNCT3))
      op_I_DE = `BGEU_I; 
    else if ((op_DE == `CSRR_OPCODE) && (F3_DE == `CSRR_FUNCT3))
      op_I_DE = `CSRR_I; 
    else if ((op_DE == `CSRW_OPCODE) && (F3_DE == `CSRW_FUNCT3))
      op_I_DE = `CSRW_I; 
    else 
      op_I_DE = `INVALID_I; 
  end 

always @(*) begin
    type_I_DE = `TYPENOBITS'bx;
    type_immediate_DE = `IMMTYPENOBITS'bx;

    if ((op_I_DE == `ADD_I) || 
      (op_I_DE == `SUB_I ) || 
      (op_I_DE ==  `AND_I) || 
      (op_I_DE == `OR_I) || 
      (op_I_DE == `XOR_I) || 
      (op_I_DE == `SLT_I) || 
      (op_I_DE ==  `SLTU_I) || 
      (op_I_DE ==  `SRA_I) || 
      (op_I_DE == `SRL_I ) || 
      (op_I_DE == `SLL_I) || 
      (op_I_DE ==  `MUL_I) ) begin 
        type_I_DE = `R_Type;
      end

    else if ((op_I_DE == `CSRR_I) || 
      (op_I_DE == `CSRW_I) || 
      (op_I_DE == `ADDI_I ) || 
      (op_I_DE == `ANDI_I) || 
      (op_I_DE == `ORI_I) || 
      (op_I_DE == `XORI_I) || 
      (op_I_DE == `SLTI_I) ||  
      (op_I_DE == `SLTIU_I ) || 
      (op_I_DE == `LW_I ) || 
      (op_I_DE == `JR_I) || 
      (op_I_DE == `JALR_I) ) begin 
        type_I_DE = `I_Type; 
        type_immediate_DE = `I_immediate;
      end 

    else if ((op_I_DE ==  `SRAI_I ) || 
      (op_I_DE == `SRLI_I) || 
      (op_I_DE == `SLLI_I)) begin
        type_I_DE = `I_Type;
        type_immediate_DE = `I_immediate;
      end

    else if ((op_I_DE ==  `LUI_I) || 
      (op_I_DE == `AUIPC_I )) begin 
        type_I_DE = `I_Type; 
        type_immediate_DE = `U_immediate; 
      end

    else if (op_I_DE == `SW_I) begin
        type_I_DE = `S_Type;
        type_immediate_DE = `S_immediate;  
      end

    else if (op_I_DE ==  `JAL_I) begin 
        type_I_DE = `U_Type;
        type_immediate_DE = `J_immediate; 
      end

    else if ((op_I_DE ==  `BEQ_I ) || 
      (op_I_DE == `BNE_I) || 
      (op_I_DE == `BLT_I) || 
      (op_I_DE == `BGE_I) || 
      (op_I_DE == `BLTU_I) || 
      (op_I_DE == `BGEU_I)) begin 
        type_I_DE = `S_Type;
        type_immediate_DE = `B_immediate; 
      end

end
  

//////////////////////////////////
    // **TODO: Complete the rest of the pipeline 

   reg  [`DBITS-1:0] sxt_imm_DE;
always @(*) begin 
  case (type_immediate_DE )  
  `I_immediate: 
    sxt_imm_DE = {{21{inst_DE[31]}}, inst_DE[30:25], inst_DE[24:21], inst_DE[20]}; 
  `S_immediate: 
     sxt_imm_DE =  {{21{inst_DE[31]}}, inst_DE[30:25], inst_DE[11:8], inst_DE[7]};
   `B_immediate: sxt_imm_DE = {{20{inst_DE[31]}}, inst_DE[7], inst_DE[30:25], inst_DE[11:8], 1'b0};
   `U_immediate: 
     sxt_imm_DE = {inst_DE[31], inst_DE[30:20], inst_DE[19:12], {12{1'b0}}}; 
   `J_immediate: 
    sxt_imm_DE = {{12{inst_DE[31]}}, inst_DE[19:12], inst_DE[20], inst_DE[30:25], inst_DE[24:21], 1'b0}; 
   default:
    sxt_imm_DE = 32'b0; 
  endcase  
end 
   wire wr_reg_WB; 


  wire [`REGNOBITS-1:0] rs1_DE;
  wire [`REGNOBITS-1:0] rs2_DE;
  wire [`REGNOBITS-1:0] rd_DE;

  assign rs1_DE = inst_DE[19:15];
  assign rs2_DE = inst_DE[24:20];
  assign rd_DE = inst_DE[11:7];
  wire [`DBITS-1:0] regval_1_DE;
  wire [`DBITS-1:0] regval_2_DE;
  wire wr_reg_DE;
  reg hazard;
  reg rs1_read_DE;
  reg rs2_read_DE;
  reg rs_busy;
  always @(*) begin
    case (type_I_DE)
      `I_Type:
        begin
          rs1_read_DE = 1;
          rs2_read_DE = 0;

        end
      `R_Type:
        begin
          rs1_read_DE = 1;
          rs2_read_DE = 1;
        end
      `S_Type:
        begin
          rs1_read_DE = 1;
          rs2_read_DE = 1;
        end
    endcase
  end
  assign hazard = ((wr_reg_AGEX && ((rs1_read_DE && rs1_DE == wregno_AGEX) || (rs2_read_DE && rs2_DE == wregno_AGEX))) ||
                     (wr_reg_MEM && ((rs1_read_DE && rs1_DE == wregno_MEM) || (rs2_read_DE && rs2_DE == wregno_MEM))) ||
                     (wr_reg_WB && ((rs1_read_DE && rs1_DE == wregno_WB) || (rs2_read_DE && rs2_DE == wregno_WB)))) ? 1 : 0;
  assign regval_1_DE = regs[rs1_DE];
  assign regval_2_DE = regs[rs2_DE];

  assign wr_reg_DE = ((op_I_DE == `ADD_I) || (op_I_DE == `ADDI_I)) || 
                        (op_I_DE == `AUIPC_I) || (op_I_DE == `JAL_I) || 
                        (op_I_DE == `JALR_I) || (op_I_DE == `LUI_I) ||
                        (op_I_DE == `SUB_I) || (op_I_DE == `OR_I) || 
                        (op_I_DE == `ORI_I) || (op_I_DE == `AND_I) ||
                        (op_I_DE == `ANDI_I) || (op_I_DE == `XOR_I) ||
                        (op_I_DE == `XORI_I) || (op_I_DE == `SLL_I) ||
                         (op_I_DE == `SLT_I) || (op_I_DE == `MUL_I) || 
                        (op_I_DE == `SLTU_I) || (op_I_DE == `SRA_I) || 
                        (op_I_DE == `SRL_I) || (op_I_DE == `SLL_I) ||
                        (op_I_DE == `SLTI_I) || (op_I_DE == `SLTIU_I) ||
                        (op_I_DE == `SRAI_I) || (op_I_DE == `SRLI_I) ||
                        (op_I_DE == `SLLI_I) || (op_I_DE == `LW_I) ? 1 : 0;
 
 /* this signal is passed from WB stage */ 
  wire wr_reg_WB; // is this instruction writing into a register file? 
  wire [`REGNOBITS-1:0] wregno_WB; // destination register ID 
  wire [`DBITS-1:0] regval_WB;  // the contents to be written in the register file (or CSR )
  wire wr_reg_MEM; // is this instruction writing into a register file? 
  wire [`REGNOBITS-1:0] wregno_MEM; // destination register ID 
  // signals come from WB stage for register WB 
  assign { wr_reg_WB, wregno_WB, regval_WB} = from_WB_to_DE;  
  assign { wr_reg_MEM, wregno_MEM } = from_MEM_to_DE;

  wire pipeline_stall_DE;
  assign pipeline_stall_DE = hazard || PC_DE > 32'h500;
  assign from_DE_to_FE = {pipeline_stall_DE}; // pass the DE stage stall signal to FE stage 
  wire br_cond_DE;
  wire [`REGNOBITS-1:0] wregno_AGEX; 
  wire wr_reg_AGEX;
  assign {
    br_cond_DE,
    wr_reg_AGEX,
    wregno_AGEX 
  } = from_AGEX_to_DE;
// decoding the contents of FE latch out. the order should be matched with the fe_stage.v 
  assign {
            valid_DE,
            inst_DE,
            PC_DE, 
            pcplus_DE,
            inst_count_DE 
            }  = from_FE_latch;  // based on the contents of the latch, you can decode the content 


// assign wire to send the contents of DE latch to other pipeline stages  
  assign DE_latch_out = DE_latch; 

   assign DE_latch_contents = {
                                  valid_DE, 
                                  inst_DE,
                                  PC_DE,
                                  pcplus_DE,
                                  op_I_DE,
                                  inst_count_DE,
                                  regval_1_DE,
                                  regval_2_DE,
                                  sxt_imm_DE,
                                  rd_DE,
                                  wr_reg_DE
                                  // more signals might need
                                  }; 




  always @ (negedge clk) begin 
  /* register write code is completed for your benefit */ 
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
      regs[16] <= {`DBITS{1'b0}};
      regs[17] <= {`DBITS{1'b0}};
      regs[18] <= {`DBITS{1'b0}};
      regs[19] <= {`DBITS{1'b0}};
      regs[20] <= {`DBITS{1'b0}};
      regs[21] <= {`DBITS{1'b0}};
      regs[22] <= {`DBITS{1'b0}};
      regs[23] <= {`DBITS{1'b0}};
      regs[24] <= {`DBITS{1'b0}};
      regs[25] <= {`DBITS{1'b0}};
      regs[26] <= {`DBITS{1'b0}};
      regs[27] <= {`DBITS{1'b0}};
      regs[28] <= {`DBITS{1'b0}};
      regs[29] <= {`DBITS{1'b0}};
      regs[30] <= {`DBITS{1'b0}};
      regs[31] <= {`DBITS{1'b0}};
    end
    else if(wr_reg_WB && wregno_WB != 0) 
		  	regs[wregno_WB] <= regval_WB; 
  end


always @ (posedge clk) begin // you need to expand this always block 
    if(reset) begin
      DE_latch <= {`DE_latch_WIDTH{1'b0}};
      end
     else begin  
      if (pipeline_stall_DE || br_cond_DE || hazard) 
        begin
        DE_latch <= {`DE_latch_WIDTH{1'b0}};
        end
      else
          DE_latch <= DE_latch_contents;
     end 
  end



endmodule

