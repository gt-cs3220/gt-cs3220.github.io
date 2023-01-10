#include <stdlib.h>
#include <iostream>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "obj_dir/Vadder_var_seq.h" // Need to be modified for different verilog based modules

#define MAX_TIME 10
vluint64_t sim_time = 0;

int main(int argc, char** argv, char** env){
    Vadder_var_seq *dut = new Vadder_var_seq; 
    Verilated::traceEverOn(true);
    VerilatedVcdC *m_trace = new VerilatedVcdC;
    dut->trace(m_trace, 5);
    m_trace->open("waveform.vcd");
    // enable and reset - cycle 0
    dut->clk=0;   // set clock to 0 
    dut->rst_n=0; 
    dut->i_en=1;
    dut->i_data=0;
    dut->i_valid=0b0;
    dut->eval();
    m_trace->dump(sim_time); // must dump trace every cycle (sim_time)
    sim_time++;

    dut->clk^=1; // invert clock signal
    dut->rst_n=1;
    dut->eval();
    m_trace->dump(sim_time);
    sim_time++;

    // test case 1 cycle 1
    dut->clk^=1;
    dut->i_data=0x00030002;
    dut->i_valid=0b11;
    dut->eval();
    m_trace->dump(sim_time);
    sim_time++;

    dut->clk^=1;
    dut->eval();
    m_trace->dump(sim_time);
    sim_time++;

    // test case 2 - cycle 2
    dut->clk^=1;
    dut->i_data=0x00050005;
    dut->i_valid=0b11;
    dut->eval();
    m_trace->dump(sim_time);
    sim_time++;

    while(sim_time < MAX_TIME){
        dut->clk^=1;
        dut->eval();
        m_trace->dump(sim_time);
        sim_time++;
    }

    m_trace->close();
    delete dut;
    exit(EXIT_SUCCESS);
}