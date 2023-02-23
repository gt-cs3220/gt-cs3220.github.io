 `include "define.vh" 


module FE_STAGE( input wire clk, input wire reset, input wire [`from_DE_to_FE_WIDTH-1:0] from_DE_to_FE,
  input wire [`from_AGEX_to_FE_WIDTH-1:0] from_AGEX_to_FE,   
  input wire [`from_MEM_to_FE_WIDTH-1:0] from_MEM_to_FE,   
  input wire [`from_WB_to_FE_WIDTH-1:0] from_WB_to_FE, 
  input wire [`from_predictor_to_FE_WIDTH-1:0] from_predictor_to_FE,
  output wire [`from_FE_to_predictor_WIDTH-1:0] from_FE_to_predictor,
  output wire [`FE_latch_WIDTH-1:0] FE_latch_out
);

  `UNUSED_VAR (from_MEM_to_FE)
  `UNUSED_VAR (from_WB_to_FE)

  // I-MEM
  (* ram_init_file = `IDMEMINITFILE *)
  reg [`DBITS-1:0] imem [`IMEMWORDS-1:0];
 
  initial begin
      $readmemh(`IDMEMINITFILE , imem);
  end

  // Display memory contents with verilator 
  /*
  always @(posedge clk) begin
    for (integer i=0 ; i<`IMEMWORDS ; i=i+1) begin
        $display("%h", imem[i]);
    end
  end
  */

  /* pipeline latch */ 
  reg [`FE_latch_WIDTH-1:0] FE_latch;  // FE latch 
  wire valid_FE;
  wire br_cond_FE; 
  `UNUSED_VAR(valid_FE)
  reg [`DBITS-1:0] PC_FE_latch; // PC latch in the FE stage   // you could use a part of FE_latch as a PC latch as well 
  
  reg [`DBITS-1:0] inst_count_FE; /* for debugging purpose */ 
  
  wire [`DBITS-1:0] inst_count_AGEX; /* for debugging purpose. resent the instruction counter */ 

  wire [`INSTBITS-1:0] inst_FE;  // instruction value in the FE stage 
  wire [`DBITS-1:0] pcplus_FE;  // pc plus value in the FE stage 
  wire stall_pipe_FE; // signal to indicate when a front-end needs to be stall
  reg [`DBITS-1:0] branch_pc_FE;
  wire [`FE_latch_WIDTH-1:0] FE_latch_contents;  // the signals that will be FE latch contents 
  
  // reading instruction from imem 
  assign inst_FE = imem[PC_FE_latch[`IMEMADDRBITS-1:`IMEMWORDBITS]];  // this code works. imem is stored 4B together 
  
  // wire to send the FE latch contents to the DE stage 
  assign FE_latch_out = FE_latch; 
 
  assign {
    stall_pipe_FE
  } = from_DE_to_FE;
  // This is the value of "incremented PC", computed in the FE stage
  assign pcplus_FE = PC_FE_latch + `INSTSIZE;
  
   
   // the order of latch contents should be matched in the decode stage when we extract the contents. 
  assign FE_latch_contents = {
                                valid_FE, 
                                inst_FE, 
                                PC_FE_latch, 
                                pcplus_FE, // please feel free to add more signals such as valid bits etc. 
                                inst_count_FE,
                                 // if you add more bits here, please increase the width of latch in VX_define.vh 
                                predicted_take,
                                BHR_FE,
                                PHT_index_FE,
                                PHT_entry_FE
                                };

  wire [`DBITS-1:0] target_addr;
  wire taken;
  wire [7:0] PHT_index_FE;
  wire [7:0] BHR_FE;
  wire [1:0] PHT_entry_FE;
  wire [3:0] BTB_index_FE;
  wire [60:0] BTB_entry_FE;
  assign {
    br_cond_FE,
    branch_pc_FE
  } = from_AGEX_to_FE;
  // **TODO: Complete the rest of the pipeline 
  assign from_FE_to_predictor = {PC_FE_latch};
  assign {
    taken,
    BTB_hit,
    target_addr,
    BHR_FE,
    PHT_index_FE,
    PHT_entry_FE,
    BTB_index_FE
  } = from_predictor_to_FE;
  wire BTB_hit;
  always @ (posedge clk) begin
  /* you need to extend this always block */
   if (reset) begin 
      PC_FE_latch <= `STARTPC;
      inst_count_FE <= 1;  /* inst_count starts from 1 for easy human reading. 1st fetch instructions can have 1 */ 
      end 
   else if (predicted_take)
     PC_FE_latch <= target_addr;
      else if (br_cond_FE)
        PC_FE_latch <= branch_pc_FE;
     else if(!stall_pipe_FE) begin 
      PC_FE_latch <= pcplus_FE;
      inst_count_FE <= inst_count_FE + 1; 
      end 
    else 
      PC_FE_latch <= PC_FE_latch;
  end
  
  wire predicted_take;
  assign predicted_take = BTB_hit && taken;

  always @ (posedge clk) begin
    if(reset) 
        begin 
            FE_latch <= {`FE_latch_WIDTH{1'b0}}; 
            inst_count_FE <= 1;  /* inst_count starts from 1 for easy human reading. 1st fetch instructions can have 1 */ 
            // ...
        end 
     else if (br_cond_FE == 1'b1)
        begin
            FE_latch <= {`FE_latch_WIDTH{1'b0}};
        end
     else  
        begin 
         // this is just an example. you need to expand the contents of if/else
         if  (stall_pipe_FE) begin 
            FE_latch <= FE_latch; 
            inst_count_FE <= inst_count_FE + 1;
            end  
          else 
            FE_latch <= FE_latch_contents; 
        end  
  end
endmodule
