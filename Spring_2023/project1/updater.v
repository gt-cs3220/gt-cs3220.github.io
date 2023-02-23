`include "define.vh" 

module UPDATER(
  input wire clk,
  input wire reset,
  input wire [`from_AGEX_to_updater_WIDTH-1:0] from_AGEX_to_updater,
  output wire [`from_updater_to_predictor_WIDTH-1:0] from_updater_to_predictor
);

wire [7:0] BHR_updater;
wire [7:0] PHT_index_updater;
wire [1:0] PHT_entry_updater;
wire [`DBITS-1:0] PC_updater;
wire br_cond_updater;
wire is_branch;
wire [`DBITS-1:0] target_addr;

assign {PC_updater, is_branch, br_cond_updater, target_addr, BHR_updater, PHT_index_updater, PHT_entry_updater} = from_AGEX_to_updater;
assign PHT_index_updater = PC_updater[9:2] ^ BHR_updater;

wire [7:0] updated_BHR;
reg [1:0] updated_PHT_entry;
wire [58:0] updated_BTB_entry;
wire [3:0] BTB_index;
wire [`DBITS-1:0] target_addr;

assign updated_BHR = BHR_updater << 1 | {7'b0, br_cond_updater};
always @(*) begin
        if (br_cond_updater) begin
                if (PHT_entry_updater == 2'b11)
                   updated_PHT_entry = 2'b11; 
                else
                   updated_PHT_entry = PHT_entry_updater + 1;
        end
        else begin
                if (PHT_entry_updater == 2'b00)
                        updated_PHT_entry = 2'b00;
                else
                        updated_PHT_entry = PHT_entry_updater - 1;

        end
end
assign updated_BTB_entry = {PC_updater[`DBITS-1:6] << 33, 1'b1 << 32, target_addr};

assign from_updater_to_predictor = {
  is_branch,
  updated_BHR,
  PHT_index_updater,
  updated_PHT_entry,
  PC_updater[5:2],
  updated_BTB_entry
};
endmodule
