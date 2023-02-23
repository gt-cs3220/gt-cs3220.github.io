`include "define.vh" 


module BR_PREDICTOR(
  input wire clk,
  input wire reset,
  input wire [`from_FE_to_predictor_WIDTH-1:0] from_FE_to_predictor, 
  input wire [`from_updater_to_predictor_WIDTH-1:0] from_updater_to_predictor,
  output wire [`from_predictor_to_FE_WIDTH-1:0] from_predictor_to_FE
);


  /* pipeline latch*/ 
  wire [`DBITS-1:0] PC_BR;
  assign {
    PC_BR
  } = from_FE_to_predictor;

  reg [1:0] PHT[0:255];
  reg [7:0] BHR;
  reg [58:0] BTB[0:15];
  integer i;
  initial
    begin
      for (i = 0; i < 256; i++)
        PHT[i] = 2'b10;
    end
  wire [7:0] PHT_index;
  wire [58:0] BTB_entry;
  assign BTB_entry = BTB[PC_BR[5:2]];
  assign PHT_index = BHR ^ PC_BR[9:2];
  wire BTB_hit;
  assign BTB_hit = (BTB_entry[58:33] == PC_BR[`DBITS-1:6] && BTB_entry[32] == 1);
  wire [`DBITS-1:0] target_addr;
  assign target_addr = BTB_entry[`DBITS-1:0];
  wire taken;
  assign taken = PHT[PHT_index] >= 2 ? 1 : 0;     
  assign from_predictor_to_FE = {taken, BTB_hit, target_addr, BHR, PHT_index, PHT[PHT_index], PC_BR[3:0]}; 
  
  wire [7:0] updated_BHR;
  wire [7:0] PHT_index_updater;
  wire [1:0] PHT_entry_updater;
  wire [3:0] BTB_index_updater;
  wire [58:0] BTB_entry_updater;
  wire br_cond_predictor;
  wire is_branch;

  assign {
    is_branch,
    updated_BHR,
    PHT_index_updater,
    PHT_entry_updater,
    BTB_index_updater,
    BTB_entry_updater
  } = from_updater_to_predictor;
  
  always @(posedge clk) begin
    if (reset)
        BHR <= 8'b0;
    else if (is_branch)
        begin
        BHR <= updated_BHR;
        PHT[PHT_index_updater] <= PHT_entry_updater;
        BTB[BTB_index_updater] <= BTB_entry_updater;
        end
  end
  endmodule
