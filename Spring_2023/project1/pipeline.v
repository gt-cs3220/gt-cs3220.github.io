 `include "define.vh" 

module pipeline (
  input wire clk,
  input wire reset
);
  
  reg [`DBITS-1:0] cycle_count; /* for debugging purpose */ 

  /* wires to connect between pipeline stages */ 
  
  wire [`FE_latch_WIDTH-1:0] FE_latch_out; 
  wire [`DE_latch_WIDTH-1:0] DE_latch_out; 
  wire [`AGEX_latch_WIDTH-1:0] AGEX_latch_out; 
  wire [`MEM_latch_WIDTH-1:0] MEM_latch_out;
  wire [`from_FE_to_predictor_WIDTH-1:0] from_FE_to_predictor;
  wire [`from_AGEX_to_updater_WIDTH-1:0] from_AGEX_to_updater;
  wire [`from_predictor_to_FE_WIDTH-1:0] from_predictor_to_FE;
  wire [`from_updater_to_predictor_WIDTH-1:0] from_updater_to_predictor;
  wire [`from_DE_to_FE_WIDTH-1:0] from_DE_to_FE;
  wire [`from_AGEX_to_FE_WIDTH-1:0] from_AGEX_to_FE;
  wire [`from_MEM_to_FE_WIDTH-1:0] from_MEM_to_FE;
  wire [`from_WB_to_FE_WIDTH-1:0] from_WB_to_FE;

  wire [`from_AGEX_to_DE_WIDTH-1:0] from_AGEX_to_DE;
  wire [`from_MEM_to_DE_WIDTH-1:0] from_MEM_to_DE;
  wire [`from_WB_to_DE_WIDTH-1:0] from_WB_to_DE;

  wire [`from_MEM_to_AGEX_WIDTH-1:0] from_MEM_to_AGEX;
  wire [`from_WB_to_AGEX_WIDTH-1:0] from_WB_to_AGEX;

  wire [`from_WB_to_MEM_WIDTH-1:0] from_WB_to_MEM; 

  FE_STAGE my_FE_stage(
    .clk(clk), 
    .reset(reset), 
    .from_DE_to_FE(from_DE_to_FE),
    .from_AGEX_to_FE(from_AGEX_to_FE),
    .from_MEM_to_FE(from_MEM_to_FE),
    .from_WB_to_FE(from_WB_to_FE),
    .from_FE_to_predictor(from_FE_to_predictor),
    .from_predictor_to_FE(from_predictor_to_FE),
    .FE_latch_out(FE_latch_out)
  ); 
                     
  BR_PREDICTOR my_BR_PREDICTOR(
    .clk(clk),
    .reset(reset),
    .from_FE_to_predictor(from_FE_to_predictor),
    .from_predictor_to_FE(from_predictor_to_FE),
    .from_updater_to_predictor(from_updater_to_predictor)
  );

  DE_STAGE my_DE_stage(
    .clk(clk),
    .reset(reset),
    .from_FE_latch(FE_latch_out),
    .from_AGEX_to_DE(from_AGEX_to_DE),  
    .from_MEM_to_DE(from_MEM_to_DE),     
    .from_WB_to_DE(from_WB_to_DE), 
    .from_DE_to_FE(from_DE_to_FE),   
    .DE_latch_out(DE_latch_out)
  );

  AGEX_STAGE my_AGEX_stage(
    .clk(clk),
    .reset(reset),
    .from_MEM_to_AGEX(from_MEM_to_AGEX),    
    .from_WB_to_AGEX(from_WB_to_AGEX),   
    .from_DE_latch(DE_latch_out),
    .AGEX_latch_out(AGEX_latch_out),
    .from_AGEX_to_FE(from_AGEX_to_FE),
    .from_AGEX_to_DE(from_AGEX_to_DE),
    .from_AGEX_to_updater(from_AGEX_to_updater)
  );

  UPDATER my_updater(
    .clk(clk),
    .reset(reset),
    .from_AGEX_to_updater(from_AGEX_to_updater),
    .from_updater_to_predictor(from_updater_to_predictor)
  );

  MEM_STAGE my_MEM_stage(
    .clk(clk),
    .reset(reset),
    .from_WB_to_MEM(from_WB_to_MEM),  
    .from_AGEX_latch(AGEX_latch_out), 
    .MEM_latch_out(MEM_latch_out),
    .from_MEM_to_FE(from_MEM_to_FE),
    .from_MEM_to_DE(from_MEM_to_DE),
    .from_MEM_to_AGEX(from_MEM_to_AGEX)
  );     
       
  WB_STAGE my_WB_stage(
    .clk(clk),
    .reset(reset),  
    .from_MEM_latch(MEM_latch_out),
    .from_WB_to_FE(from_WB_to_FE),
    .from_WB_to_DE(from_WB_to_DE),  
    .from_WB_to_AGEX(from_WB_to_AGEX),
    .from_WB_to_MEM(from_WB_to_MEM)
  );

  always @ (posedge clk) begin
    if (reset) begin
      cycle_count <= 0; 
    end else begin
      cycle_count <= cycle_count + 1;    
    end
  end

endmodule









