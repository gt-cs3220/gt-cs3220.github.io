// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vadder_var_seq.h for the primary calling header

#ifndef VERILATED_VADDER_VAR_SEQ___024ROOT_H_
#define VERILATED_VADDER_VAR_SEQ___024ROOT_H_  // guard

#include "verilated.h"

class Vadder_var_seq__Syms;

class Vadder_var_seq___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clk,0,0);
    VL_IN8(rst_n,0,0);
    VL_IN8(i_valid,1,0);
    VL_OUT8(o_valid,0,0);
    VL_IN8(i_en,0,0);
    CData/*0:0*/ adder_var_seq__DOT__calcuate_en;
    CData/*0:0*/ adder_var_seq__DOT__o_valid_inner;
    CData/*0:0*/ __Vtrigrprev__TOP__clk;
    CData/*0:0*/ __Vtrigrprev__TOP__rst_n;
    CData/*0:0*/ __VactContinue;
    VL_IN(i_data,31,0);
    VL_OUT(o_data,16,0);
    IData/*16:0*/ adder_var_seq__DOT__o_data_inner;
    IData/*31:0*/ __VstlIterCount;
    IData/*31:0*/ __VicoIterCount;
    IData/*31:0*/ __VactIterCount;
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<1> __VicoTriggered;
    VlTriggerVec<1> __VactTriggered;
    VlTriggerVec<1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vadder_var_seq__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vadder_var_seq___024root(Vadder_var_seq__Syms* symsp, const char* name);
    ~Vadder_var_seq___024root();
    VL_UNCOPYABLE(Vadder_var_seq___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);


#endif  // guard
