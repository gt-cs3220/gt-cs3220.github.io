 `include "define.vh" 

module WB_STAGE(
  input wire                              clk,
  input wire                              reset,  
  input wire [`MEM_latch_WIDTH-1:0]       from_MEM_latch,
  output wire [`from_WB_to_FE_WIDTH-1:0]  from_WB_to_FE,
  output wire [`from_WB_to_DE_WIDTH-1:0]  from_WB_to_DE,  
  output wire [`from_WB_to_AGEX_WIDTH-1:0] from_WB_to_AGEX,
  output wire [`from_WB_to_MEM_WIDTH-1:0] from_WB_to_MEM
);


  wire [`IOPBITS-1:0] op_I_WB;
  wire [`INSTBITS-1:0] inst_WB; 
  wire [`DBITS-1:0] PC_WB;
  wire [`DBITS-1:0] inst_count_WB; 

  wire [`REGWORDS-1:0] result;
  wire store_slti;

  wire [`BUS_CANARY_WIDTH-1:0] bus_canary_WB;

  
  wire wr_reg_WB; // is this instruction writing into a register file? 
  
  wire [`REGNOBITS-1:0] wregno_WB; // destination register ID 
  wire [`DBITS-1:0] regval_WB;  // the contents to be written in the register file (or CSR )
  
  wire [`CSRNOBITS-1:0] wcsrno_WB;  // desitnation CSR register ID 
  wire wr_csr_WB; // is this instruction writing into CSR ? 

  wire clr_busybit;
  // **TODO: Complete the rest of the pipeline**
  
  assign wr_reg_WB = ((op_I_WB == `ADD_I || op_I_WB == `ADDI_I || op_I_WB == `SUB_I || op_I_WB == `MUL_I || op_I_WB == `AND_I || op_I_WB == `ANDI_I || op_I_WB == `OR_I || op_I_WB == `ORI_I || op_I_WB == `XOR_I || op_I_WB == `XORI_I || op_I_WB == `LUI_I || op_I_WB == `AUIPC_I || op_I_WB == `JAL_I || op_I_WB == `JALR_I || store_slti) && inst_WB[11:7] != 0) ? 1 : 0;
  assign wregno_WB = inst_WB[11:7];
  assign regval_WB = result;
  assign clr_busybit = (op_I_WB == `SLTI_I || op_I_WB == `SLTIU_I) ? 1 : 0;
    
   assign {
                                inst_WB,
                                PC_WB,
                                op_I_WB,
                                inst_count_WB, 
                                // more signals might need      
                                result,
                                store_slti,                  
                                bus_canary_WB 
                                } = from_MEM_latch; 
        
        // write register by sending data to the DE stage 
        



// we send register write (and CSR register) information to DE stage (also opcode and write to reg)
assign from_WB_to_DE = {wr_reg_WB, wregno_WB, regval_WB, wcsrno_WB, wr_csr_WB, clr_busybit};  

// this code need to be commented out when we synthesize the code later 
    // special workaround to get tests Pass/Fail status
  reg [`DBITS-1:0] last_WB_value [`REGWORDS-1:0] /* verilator public */;
  reg [`DBITS-1:0] WB_counters[`REGWORDS-1:0]   /* verilator public */ ;
  always @(negedge clk) begin
  if (wr_reg_WB)
    last_WB_value[wregno_WB] <= regval_WB;
  end

  // this is only for debugging purpose to interact with sim_main.cpp when we use verilator 
  always @(posedge clk) begin 
// don't use WB_counters[0] 
    WB_counters[1] <=  PC_WB;   
    WB_counters[2] <=  inst_WB;   
    WB_counters[3] <=  {31'b0, wr_reg_WB};   
    WB_counters[4] <=  regval_WB;   
    WB_counters[5] <= inst_count_WB; 
    WB_counters[6] <= {26'b0, op_I_WB}; 
    WB_counters[7] <= {27'b0, wregno_WB};   
  end 

endmodule 
