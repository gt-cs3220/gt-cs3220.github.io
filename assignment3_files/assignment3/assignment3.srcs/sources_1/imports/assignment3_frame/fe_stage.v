 `include "VX_define.vh" 


module FE_STAGE(
  input clk,
  input reset,
  input [`from_DE_to_FE_WIDTH-1:0] from_DE_to_FE,
  input [`from_AGEX_to_FE_WIDTH-1:0] from_AGEX_to_FE,   
  input [`from_MEM_to_FE_WIDTH-1:0] from_MEM_to_FE,   
  input [`from_WB_to_FE_WIDTH-1:0] from_WB_to_FE, 
  output[`FE_latch_WIDTH-1:0] FE_latch_out
);


  // I-MEM
  (* ram_init_file = `IDMEMINITFILE *)
  reg [`DBITS-1:0] imem [`IMEMWORDS-1:0];
 
   initial begin
        $readmemh(`IDMEMINITFILE , imem);
  end

/* pipeline latch */ 
  reg [`FE_latch_WIDTH-1:0] FE_latch;  // FE latch 

  reg [`DBITS-1:0] PC_FE_latch; // PC latch in the FE stage   // you could use a part of FE_latch as a PC latch as well 
  
  wire [`INSTBITS-1:0] inst_FE;  // instruction value in the FE stage 
  wire [`DBITS-1:0] pcplus_FE;  // pc plus value in the FE stage 
  wire stall_pipe; // signal to indicate when a front-end needs to be stall
  
  wire [`FE_latch_WIDTH-1:0] FE_latch_contents; 
  
  // if AGEX calculates branch, use these
  wire br_cond_FE;
  wire [`INSTBITS-1:0] pctarget_FE;
  
  // reading instruction from imem 
  assign inst_FE = imem[PC_FE_latch[`IMEMADDRBITS-1:`IMEMWORDBITS]]; 
  
  // wire to send the FE latch contents to the DE stage 
  assign FE_latch_out = FE_latch; 

  // Read AGEX branch signals
  assign {
            br_cond_FE,
            pctarget_FE
            } = from_AGEX_to_FE;

  // This is the value of "incremented PC", computed in the FE stage
  assign pcplus_FE = PC_FE_latch + `INSTSIZE;
  
   
   // the order of latch contents should be matched in the decode stage when we extract the contents. 
  assign FE_latch_contents = { 
                                inst_FE, 
                                PC_FE_latch, 
                                pcplus_FE, // please feel free to add more signals such as valid bits etc. 
                                // if you add more bits here, please increase the width of latch in VX_define.vh 
                                `BUS_CANARY_VALUE // for an error checking of bus encoding/decoding  
                                };
   
assign {
    stall_pipe
} = from_DE_to_FE;
   
  always @ (posedge clk or posedge reset) begin
    if(reset)
      PC_FE_latch <= `STARTPC;
    else if (br_cond_FE)
      PC_FE_latch <= pctarget_FE;
    else if(!stall_pipe)
      PC_FE_latch <= pcplus_FE;
    else
      PC_FE_latch <= PC_FE_latch;
  end
  

  always @ (posedge clk or posedge reset) begin
    if(reset || br_cond_FE) 
        begin 
        FE_latch <= {`FE_latch_WIDTH{1'b0}}; 
        end 
     else
        begin  
            FE_latch <= FE_latch_contents; 
        end  
  end
 
 
 
endmodule