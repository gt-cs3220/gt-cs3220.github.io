// DESCRIPTION:  simulation of pipeline 
//======================================================================
#include <iostream>

// Include common routines
#include <verilated.h>
// Include model header, generated from Verilating "pipeline.v"
#include "Vpipeline.h"
#include "Vpipeline__Syms.h"

#ifdef VCD_OUTPUT
#include <verilated_vcd_c.h>
#endif

#define RUN_CYCLES  400000

#define CLOCK_PERIOD 2

#define RESET_TIME  10

// Current simulation time (64-bit unsigned)
uint64_t timestamp = 0;

double sc_time_stamp() { 
  return timestamp;
}

int main(int argc, char** argv, char** env) {
    // turn off unused variable warnings
    if (0 && argc && argv && env) {}

    // Construct the Verilated model
    Vpipeline* dut = new Vpipeline();

#ifdef VCD_OUTPUT
    Verilated::traceEverOn(true);
    auto trace = new VerilatedVcdC();
    dut->trace(trace, 2999);
    trace->open("trace.vcd");
#endif

#ifdef DPRINTF
    uint64_t inst_count_WB = 0;
    uint64_t timestamp_WB = 0;
#endif

    dut->clk = 0;
    dut->reset = 0;

    while (timestamp < RUN_CYCLES) {      
        bool clk_transition = (timestamp % CLOCK_PERIOD) == 0;
        if (clk_transition) 
            dut->clk = !dut->clk; 

        if (timestamp > 1 && timestamp < RESET_TIME) {
            dut->reset = 1;  // Assert reset
        } else {
            dut->reset = 0;  // Deassert reset
        }
        
        // Evaluate model
        dut->eval();

    #ifdef DPRINTF 
        // Verilator allows to access verilator public data structure
        if (clk_transition && dut->clk) {
            bool valid_WB = (int)dut->pipeline->my_WB_stage->WB_counters[0] != 0;
            if (valid_WB)  { 
                std::cout << "[" << (int)(timestamp) << "] ";
                std::cout << " PC=0x"   << std::hex << (int)dut->pipeline->my_WB_stage->WB_counters[1];
                std::cout << " Inst=0x" << std::hex << (int)dut->pipeline->my_WB_stage->WB_counters[2];
                std::cout << " Op="     << std::dec << (int)dut->pipeline->my_WB_stage->WB_counters[3];
                int wr_reg_WB = (int)dut->pipeline->my_WB_stage->WB_counters[4];
                if (wr_reg_WB) {
                    std::cout << " wr_reg=" << std::dec << wr_reg_WB; 
                    std::cout << " wregno=" << std::dec << (int)dut->pipeline->my_WB_stage->WB_counters[5];
                    std::cout << " regval=" << std::dec << (int)dut->pipeline->my_WB_stage->WB_counters[6];
                }
                std::cout << std::endl; 
                
                ++inst_count_WB;
                timestamp_WB = timestamp - RESET_TIME;
            }
        }

    #endif

    #ifdef VCD_OUTPUT
        trace->dump(timestamp);
    #endif
        ++timestamp;
    }

#ifdef DPRINTF
    std::cout << "Total instructions=" << std::dec << inst_count_WB << ", cycles=" << (timestamp_WB / 2) << ", IPC=" << ((inst_count_WB * 2.0f) / timestamp_WB) << std::endl; 
#endif

    int exitcode = (int)dut->pipeline->my_WB_stage->last_WB_value[3];

    // Final model cleanup
    dut->final();

#ifdef VCD_OUTPUT
    trace->close();
    delete trace;
#endif

    // Destroy DUT
    delete dut;

    // TinyRV1 test Pass/Fail status
    if (1 == exitcode)
        std::cout<<"Passed!"<<std::endl;
    else
        std::cout<<"Failed. exitcode: "<<exitcode<<std::endl;

    // Fin
    exit(0);
}