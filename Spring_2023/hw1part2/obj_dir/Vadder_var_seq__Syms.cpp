// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table implementation internals

#include "Vadder_var_seq__Syms.h"
#include "Vadder_var_seq.h"
#include "Vadder_var_seq___024root.h"

// FUNCTIONS
Vadder_var_seq__Syms::~Vadder_var_seq__Syms()
{
}

Vadder_var_seq__Syms::Vadder_var_seq__Syms(VerilatedContext* contextp, const char* namep, Vadder_var_seq* modelp)
    : VerilatedSyms{contextp}
    // Setup internal state of the Syms class
    , __Vm_modelp{modelp}
    // Setup module instances
    , TOP{this, namep}
{
    // Configure time unit / time precision
    _vm_contextp__->timeunit(-9);
    _vm_contextp__->timeprecision(-12);
    // Setup each module's pointers to their submodules
    // Setup each module's pointer back to symbol table (for public functions)
    TOP.__Vconfigure(true);
}
