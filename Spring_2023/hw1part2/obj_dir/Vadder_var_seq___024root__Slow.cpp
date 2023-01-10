// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vadder_var_seq.h for the primary calling header

#include "verilated.h"

#include "Vadder_var_seq__Syms.h"
#include "Vadder_var_seq___024root.h"

void Vadder_var_seq___024root___ctor_var_reset(Vadder_var_seq___024root* vlSelf);

Vadder_var_seq___024root::Vadder_var_seq___024root(Vadder_var_seq__Syms* symsp, const char* name)
    : VerilatedModule{name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vadder_var_seq___024root___ctor_var_reset(this);
}

void Vadder_var_seq___024root::__Vconfigure(bool first) {
    if (false && first) {}  // Prevent unused
}

Vadder_var_seq___024root::~Vadder_var_seq___024root() {
}
