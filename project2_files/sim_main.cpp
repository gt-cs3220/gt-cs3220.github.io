// DESCRIPTION: Verilator: Verilog example module
//
// This file ONLY is placed into the Public Domain, for any use,
// without warranty, 2017 by Wilson Snyder.
//======================================================================

// Include common routines
#include <verilated.h>

// Include model header, generated from Verilating "tb_project2.v"
#include "Vproject2_frame.h"

// Current simulation time (64-bit unsigned)
vluint64_t main_time = 0;

int main(int argc, char** argv, char** env) {
    // See a similar example walkthrough in the verilator manpage.

    // This is intended to be a minimal example.  Before copying this to start a
    // real project, it is better to start with a more complete example,
    // e.g. examples/c_tracing.

    // Prevent unused variable warnings
    if (0 && argc && argv && env) {}

    // Construct the Verilated model, from Vtop.h generated from Verilating "top.v"
    Vproject2_frame* prj = new Vproject2_frame ;

    // set some inputs 
    prj->clk = 0; 
    prj->reset = 0; 
    prj->KEY = 15;



    // Simulate until $finish
    while (!Verilated::gotFinish()) {
        main_time++; 
        if ((main_time%10)) prj->clk = !prj->clk; 

        if (main_time > 1 && main_time < 10) {
            prj->reset = !1;  // Assert reset
        } else {
            prj->reset = !0;  // Deassert reset
        }
        // Evaluate model
        prj->eval();
    }

    // Final model cleanup
    prj->final();

    // Destroy model
    delete prj;

    // Fin
    exit(0);
}
