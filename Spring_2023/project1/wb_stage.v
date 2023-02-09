 `include "define.vh" 


module WB_STAGE(
  input wire clk,
  input wire reset,  
  input wire [`MEM_latch_WIDTH-1:0] from_MEM_latch,
  output wire [`from_WB_to_FE_WIDTH-1:0] from_WB_to_FE,
  output wire [`from_WB_to_DE_WIDTH-1:0] from_WB_to_DE,  
  output wire [`from_WB_to_AGEX_WIDTH-1:0] from_WB_to_AGEX,
  output wire [`from_WB_to_MEM_WIDTH-1:0] from_WB_to_MEM
);

  wire valid_WB; 
  wire [`IOPBITS-1:0] op_I_WB;
  wire [`INSTBITS-1:0] inst_WB; 
  wire [`DBITS-1:0] PC_WB;
  wire [`DBITS-1:0] inst_count_WB; 


  
  wire wr_reg_WB; // is this instruction writing into a register file? 
  
  wire [`REGNOBITS-1:0] wregno_WB; // destination register ID 
  wire [`DBITS-1:0] regval_WB;  // the contents to be written in the register file (or CSR )
  


  // **TODO: Complete the rest of the pipeline**
 
    
   assign {                     
                                valid_WB,
                                inst_WB,
                                PC_WB,
                                op_I_WB,
                                inst_count_WB
                                // more signals might need                        
                                 } = from_MEM_latch; 
        
        // write register by sending data to the DE stage 
        



// we send register write (and CSR register) information to DE stage 
assign from_WB_to_DE = {wr_reg_WB, wregno_WB, regval_WB} ;  

// this code need to be commented out when we synthesize the code later 
    // special workaround to get tests Pass/Fail status
    reg [`REGWORDS-1:0][31:0] last_WB_value /* verilator public */;


  always @(negedge clk) begin
  if (reset) begin
      for (int i = 0; i < `REGWORDS; ++i) begin
        last_WB_value[i] <= 0;
      end
    end else begin
    if (wr_reg_WB)
      last_WB_value[wregno_WB] <= regval_WB;
    end
  end 

  // this is only for debugging purpose to interact with sim_main.cpp when we use verilator 
  reg [`WBCOUNTERS-1:0][31:0] WB_counters /* verilator public */;
  always @(posedge clk) begin
    if (reset) begin
      WB_counters <= '0;
    end else begin
      WB_counters[0] <= 32'(valid_WB);
      WB_counters[1] <= 32'(PC_WB);   
      WB_counters[2] <= 32'(inst_WB);   
      WB_counters[3] <= 32'(op_I_WB); 
      WB_counters[4] <= 32'(wr_reg_WB);
      WB_counters[5] <= 32'(wregno_WB);
      WB_counters[6] <= 32'(regval_WB);
      WB_counters[7] <= '0;
    end
  end
endmodule 
