// DESCRIPTION: Verilator: Verilog example module
//
// This file ONLY is placed into the Public Domain, for any use,
// without warranty, 2017 by Wilson Snyder.
//======================================================================
#include <iostream>

// Include common routines
#include <verilated.h>

// Include model header, generated from Verilating "tb_project2.v"
#include "Vtb_project2.h"

// VCD output
#include "verilated_vcd_c.h"

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
    Vtb_project2* prj = new Vtb_project2 ;

    // set some inputs 
   // prj->clk = 0; 
   // prj->reset = 0; 
   // prj->KEY = 15;

    // VCD output 
    /*
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    prj->trace(tfp, 99);  // Trace 99 levels of hierarchy
    tfp->open("obj_dir/prj.vcd");
    */ 
    int exitcode = 0;

    // Simulate until $finish
    // while (!Verilated::gotFinish()) {
        while (main_time<1000) {
        main_time++; 
      
        if ((main_time%10)) prj->clk = !prj->clk; 

        if (main_time > 1 && main_time < 100) {
            prj->reset = !1;  // Assert reset
        } else {
            prj->reset = !0;  // Deassert reset
        }
        // Evaluate model
        prj->eval();
    }

  //  tfp->close();

    // Final model cleanup
    prj->final();

   //  exitcode = (int)prj->myprj->my_WB_stage->last_wb_value[3];

    // Destroy model
    delete prj;

    // Destroy trace
   //  delete tfp;

    // TinyRV1 test Pass/Fail status
    if(1 == exitcode)
        std::cout<<"Passed!"<<std::endl;
    else
        std::cout<<"Failed. exitcode: "<<exitcode<<std::endl;

    // Fin
    exit(0);
}