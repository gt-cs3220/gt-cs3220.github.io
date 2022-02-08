// DESCRIPTION: Verilator: Verilog example module
//
// This file ONLY is placed into the Public Domain, for any use,
// without warranty, 2017 by Wilson Snyder.
//======================================================================
#include <iostream>

// Include common routines
#include <verilated.h>

// Include model header, generated from Verilating "tb_project2.v"
#include "Vproject2_frame.h"
#include "Vproject2_frame__Syms.h"

#ifdef VCD_OUTPUT
#include <verilated_vcd_c.h>
#endif

// Current simulation time (64-bit unsigned)
uint64_t timestamp = 0;

double sc_time_stamp() { 
  return timestamp;
}

#define RUN_CYCLES 1000

#define CLOCK_PERIOD 10

#define RESET_TIME 100

int main(int argc, char** argv, char** env) {
    // See a similar example walkthrough in the verilator manpage.

    // This is intended to be a minimal example.  Before copying this to start a
    // real project, it is better to start with a more complete example,
    // e.g. examples/c_tracing.

    // Prevent unused variable warnings
    if (0 && argc && argv && env) {}

    // Construct the Verilated model, from Vtop.h generated from Verilating "top.v"
    Vproject2_frame* prj = new Vproject2_frame ;

  #ifdef VCD_OUTPUT
    Verilated::traceEverOn(true);
    auto trace = new VerilatedVcdC();
    prj->trace(trace, 2999);
    trace->open("trace.vcd");
  #endif

    // set some inputs 
    // prj->clk = 0; 
    // prj->reset = 0; 
    // prj->KEY = 15;

    // Simulate until $finish
    // while (!Verilated::gotFinish()) {

    while (timestamp < RUN_CYCLES) {      
        if ((timestamp % CLOCK_PERIOD)) 
            prj->clk = !prj->clk; 

        if (timestamp > 1 && timestamp < RESET_TIME) {
            prj->reset = 1;  // Assert reset
        } else {
            prj->reset = 0;  // Deassert reset
        }
        
        // Evaluate model
        prj->eval();

    #ifdef DPRINTF 
    // verilator allows to access verilator public data structure 

    /* writeback stage*/ 
        static int last_print_inst_count_WB = 0; 
        int inst_count_WB = (int)prj->project2_frame->my_WB_stage->WB_counters[5]; 
        if (inst_count_WB > last_print_inst_count_WB)  { 
            std::cout <<"[" << (int)(timestamp) << "] "; 
        std::cout <<" inst_count_WB: " <<  std::dec << inst_count_WB;
        std::cout <<" PC_WB: 0x" <<  std::hex <<  (int)prj->project2_frame->my_WB_stage->WB_counters[1];
        std::cout <<" Inst_WB: 0x" <<  std::hex <<  (int)prj->project2_frame->my_WB_stage->WB_counters[2];
        std::cout <<" Op_I:"  <<  std::dec <<  (int)prj->project2_frame->my_WB_stage->WB_counters[6];
         int wr_reg_WB = (int)prj->project2_frame->my_WB_stage->WB_counters[3];
        if (wr_reg_WB) {
        std::cout <<" wr_reg_WB:"  <<  std::dec <<  wr_reg_WB; 
        std::cout <<" regval_WB:"  <<  std::dec <<  (int)prj->project2_frame->my_WB_stage->WB_counters[4];

        std::cout <<" wregno_WB:"  <<  std::dec <<    (int)prj->project2_frame->my_WB_stage->WB_counters[7];
        }
        std::cout << std::endl; 
        last_print_inst_count_WB = inst_count_WB; 
        }

    #endif 


    #ifdef VCD_OUTPUT
        trace->dump(timestamp);
    #endif
        ++timestamp;
    }

    int exitcode = (int)prj->project2_frame->my_WB_stage->last_WB_value[3];

    // Final model cleanup
    prj->final();

#ifdef VCD_OUTPUT
    trace->close();
    delete trace;
#endif

    // Destroy model
    delete prj;

    // TinyRV1 test Pass/Fail status
    if(1 == exitcode)
        std::cout<<"Passed!"<<std::endl;
    else
        std::cout<<"Failed. exitcode: "<<exitcode<<std::endl;

    // Fin
    exit(0);
}