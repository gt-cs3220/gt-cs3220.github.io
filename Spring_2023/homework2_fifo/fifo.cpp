#include <stdlib.h>
#include <iostream>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "obj_dir/Vfifo.h" // Need to be modified for different verilog based modules

#define MAX_TIME 10
vluint64_t sim_time = 0;
int error_count = 0;
int total_errors = 0;

// update the simulator's time
void update_sim(Vfifo *dut, VerilatedVcdC *m_trace)
{
    dut->eval();
    m_trace->dump(sim_time);
    sim_time++;
}

void check_full_empty(Vfifo *dut, int full, int empty)
{
    if (dut->full != full)
    {
        std::cerr << "Time: " << sim_time << ".Incorrect full value. Expected: " << full << " Received: " << int(dut->full) << std::endl;
        error_count++;
    }
    if (dut->empty != empty)
    {
        std::cerr << "Time: " << sim_time << ".Incorrect empty value. Expected: " << empty << " Received: " << int(dut->empty) << std::endl;
        error_count++;
    }
    total_errors += 2;
}

int get_rand()
{
    return rand() % 1000;
}

/*
* Function to toggle clk to reach next similar clock edge
* NOTE: Call function after relevant signals have been set
*/
// update clk
void toggle_pos_edge_clk(Vfifo *dut, VerilatedVcdC *m_trace)
{
    dut->clk = 0;
    update_sim(dut, m_trace);
    dut->clk = 1;
    update_sim(dut, m_trace);
}

int main(int argc, char** argv, char** env){
    srand(time(NULL));
   // initialize the top module
    Vfifo *dut = new Vfifo; 
    Verilated::traceEverOn(true);
    VerilatedVcdC *m_trace = new VerilatedVcdC;
    // input_fifo : test input structure // simulation only structure 
    int input_fifo[9] = {0};

       /* dut  allows the module's input and output ports signals from simulation */ 

    dut->trace(m_trace, 5);
    m_trace->open("waveform.vcd");
    dut->clk = 0;
    update_sim(dut, m_trace);

    dut->rst_n = 1;
    toggle_pos_edge_clk(dut, m_trace);
    dut->rst_n = 0;
    toggle_pos_edge_clk(dut, m_trace);
    check_full_empty(dut, 0 ,1);

    // Add first data
    dut->push = 1; // set push signal 
    input_fifo[0] = get_rand();
    dut->i_data = input_fifo[0];
    toggle_pos_edge_clk(dut, m_trace);
    check_full_empty(dut, 0, 0);

    // Add 8 more elements
    for (int i = 1; i < 9; ++i)
    {
        dut->push = 1;
        input_fifo[i] = get_rand();
        dut->i_data = input_fifo[i];
        toggle_pos_edge_clk(dut, m_trace);
        check_full_empty(dut, i == 7 || i == 8, 0);
    }

    // Pop values and check
    for (int i = 0; i < 8; ++i)
    {
        dut->push = 0;
        // Check output value
        // compare what's out from the fifo module vs. what we pushed. 
        if (dut->o_data != input_fifo[i])
        {
            std::cerr << "Time: " << sim_time << " Incorrect empty value. Expected: " << input_fifo[i] << " Received: " << int(dut->o_data) << std::endl;
            error_count++;
        }
        total_errors++;
        dut->pop  = 1;
        toggle_pos_edge_clk(dut, m_trace);
        check_full_empty(dut, 0, i==7);
    }

    // Pop another value and check the full/empty flag
    dut->pop = 1;
            // update the clock 
    toggle_pos_edge_clk(dut, m_trace);
            // check whether the fifo is empty or not 
    check_full_empty(dut, 0, 1);

    while(sim_time < MAX_TIME){
        toggle_pos_edge_clk(dut, m_trace);
    }

    m_trace->close();
    delete dut;

    // Check for errors
    if (error_count > 0)
    {
        std::cout << "Failed with count: " << error_count << "/" << total_errors << std::endl;
    }
    else
    {
        std::cout << "Passed!" << std::endl;
    }

    exit(EXIT_SUCCESS);
}