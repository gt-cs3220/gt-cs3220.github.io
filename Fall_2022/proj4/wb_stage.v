 `include "VX_define.vh" 


module WB_STAGE(
  input clk,
  input reset,  
  input [`MEM_latch_WIDTH-1:0] from_MEM_latch,
  output[`from_WB_to_FE_WIDTH-1:0] from_WB_to_FE,
  output[`from_WB_to_DE_WIDTH-1:0] from_WB_to_DE,  
  output[`from_WB_to_AGEX_WIDTH-1:0] from_WB_to_AGEX,
  output[`from_WB_to_MEM_WIDTH-1:0] from_WB_to_MEM,
  output[31:0] reg10_val
);

  reg [31:0] reg10_val_latch; 
  wire [`IOPBITS-1:0] op_I_WB;

  wire [`INSTBITS-1:0] inst_WB; 
  wire [`DBITS-1:0] PC_WB;
  wire [`DBITS-1:0] memaddr_WB; 
  wire [`DBITS-1:0] aluout_WB;
  wire [`DBITS-1:0] rd_val_WB; 
  wire [`DBITS-1:0] regval_WB; 

  wire wr_mem_WB;
  wire wr_reg_WB;
  wire [`REGNOBITS-1:0] wregno_WB;
  wire [`DBITS-1:0] inst_count_WB; 
  wire [`BUS_CANARY_WIDTH-1:0] bus_canary_WB;

  wire [`DBITS-1:0] inst_count_WB; 

  wire [`CSRNOBITS-1:0] wcsrno_WB; 
  wire wr_csr_WB; 


  // **TODO: Complete the rest of the pipeline**
 
    
   assign {
                                inst_WB,
                                PC_WB,
                                op_I_WB,
                                rd_val_WB, 
                                aluout_WB, 
                                wr_reg_WB,
                                wregno_WB,   
                                wcsrno_WB, 
                                wr_csr_WB, 
                                inst_count_WB, 
                                // more signals might need                        
                                 bus_canary_WB 
                                 } = from_MEM_latch; 
        
        // write register by sending data to the DE stage 
        
/* dealing with CSR registers */ 

assign regval_WB = (op_I_WB == `LW_I ) ? rd_val_WB: aluout_WB; 



assign from_WB_to_DE = {wr_reg_WB, wregno_WB, regval_WB, wcsrno_WB, wr_csr_WB} ;  

// this code need to be commented out when we synthesize the code later 
    // special workaround to get tests Pass/Fail status
  reg [`DBITS-1:0] last_WB_value [`REGWORDS-1:0] /* verilator public */;
  reg [`DBITS-1:0] WB_counters[`REGWORDS-1:0]   /* verilator public */ ;
  always @(negedge clk) begin
  if (wr_reg_WB)
    last_WB_value[wregno_WB] <= regval_WB;
  end
 // assign reg10_val = 32'd33; // to check out2 works correctly 
 
 //assign reg10_val = reg10_val_latch;  // to check reg10 value  
 always @(posedge reset) 
    reg10_val_latch <= 0; 
    
    
 always @(posedge clk) begin 
    
    //if ((last_WB_value[10] == 32'hff) && (reg10_val_latch == 0)) // reg10 should be 0xff 
    if ((last_WB_value[10] == 32'hf0) && (reg10_val_latch == 0))  // intentionally check reg10 value is other than 0xff to really prove that this logic works as expected 
        reg10_val_latch <= 32'hff; 
  end 
   
    
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
