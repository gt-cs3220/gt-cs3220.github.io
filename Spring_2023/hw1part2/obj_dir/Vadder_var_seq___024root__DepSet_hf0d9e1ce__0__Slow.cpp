// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vadder_var_seq.h for the primary calling header

#include "verilated.h"

#include "Vadder_var_seq___024root.h"

VL_ATTR_COLD void Vadder_var_seq___024root___eval_static(Vadder_var_seq___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vadder_var_seq__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder_var_seq___024root___eval_static\n"); );
}

VL_ATTR_COLD void Vadder_var_seq___024root___eval_initial(Vadder_var_seq___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vadder_var_seq__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder_var_seq___024root___eval_initial\n"); );
    // Body
    vlSelf->__Vtrigrprev__TOP__clk = vlSelf->clk;
    vlSelf->__Vtrigrprev__TOP__rst_n = vlSelf->rst_n;
}

VL_ATTR_COLD void Vadder_var_seq___024root___eval_final(Vadder_var_seq___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vadder_var_seq__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder_var_seq___024root___eval_final\n"); );
}

VL_ATTR_COLD void Vadder_var_seq___024root___eval_triggers__stl(Vadder_var_seq___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vadder_var_seq___024root___dump_triggers__stl(Vadder_var_seq___024root* vlSelf);
#endif  // VL_DEBUG
VL_ATTR_COLD void Vadder_var_seq___024root___eval_stl(Vadder_var_seq___024root* vlSelf);

VL_ATTR_COLD void Vadder_var_seq___024root___eval_settle(Vadder_var_seq___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vadder_var_seq__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder_var_seq___024root___eval_settle\n"); );
    // Init
    CData/*0:0*/ __VstlContinue;
    // Body
    vlSelf->__VstlIterCount = 0U;
    __VstlContinue = 1U;
    while (__VstlContinue) {
        __VstlContinue = 0U;
        Vadder_var_seq___024root___eval_triggers__stl(vlSelf);
        if (vlSelf->__VstlTriggered.any()) {
            __VstlContinue = 1U;
            if (VL_UNLIKELY((0x64U < vlSelf->__VstlIterCount))) {
#ifdef VL_DEBUG
                Vadder_var_seq___024root___dump_triggers__stl(vlSelf);
#endif
                VL_FATAL_MT("adder_var_seq.v", 29, "", "Settle region did not converge.");
            }
            vlSelf->__VstlIterCount = ((IData)(1U) 
                                       + vlSelf->__VstlIterCount);
            Vadder_var_seq___024root___eval_stl(vlSelf);
        }
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vadder_var_seq___024root___dump_triggers__stl(Vadder_var_seq___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vadder_var_seq__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder_var_seq___024root___dump_triggers__stl\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VstlTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if (vlSelf->__VstlTriggered.at(0U)) {
        VL_DBG_MSGF("         'stl' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vadder_var_seq___024root___stl_sequent__TOP__0(Vadder_var_seq___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vadder_var_seq__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder_var_seq___024root___stl_sequent__TOP__0\n"); );
    // Body
    vlSelf->o_valid = vlSelf->adder_var_seq__DOT__o_valid_inner;
    vlSelf->o_data = vlSelf->adder_var_seq__DOT__o_data_inner;
    vlSelf->adder_var_seq__DOT__calcuate_en = (IData)(
                                                      ((3U 
                                                        == (IData)(vlSelf->i_valid)) 
                                                       & (IData)(vlSelf->i_en)));
}

VL_ATTR_COLD void Vadder_var_seq___024root___eval_stl(Vadder_var_seq___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vadder_var_seq__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder_var_seq___024root___eval_stl\n"); );
    // Body
    if (vlSelf->__VstlTriggered.at(0U)) {
        Vadder_var_seq___024root___stl_sequent__TOP__0(vlSelf);
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vadder_var_seq___024root___dump_triggers__ico(Vadder_var_seq___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vadder_var_seq__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder_var_seq___024root___dump_triggers__ico\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VicoTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if (vlSelf->__VicoTriggered.at(0U)) {
        VL_DBG_MSGF("         'ico' region trigger index 0 is active: Internal 'ico' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vadder_var_seq___024root___dump_triggers__act(Vadder_var_seq___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vadder_var_seq__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder_var_seq___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VactTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if (vlSelf->__VactTriggered.at(0U)) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @(posedge clk or negedge rst_n)\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vadder_var_seq___024root___dump_triggers__nba(Vadder_var_seq___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vadder_var_seq__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder_var_seq___024root___dump_triggers__nba\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VnbaTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if (vlSelf->__VnbaTriggered.at(0U)) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @(posedge clk or negedge rst_n)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vadder_var_seq___024root___ctor_var_reset(Vadder_var_seq___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vadder_var_seq__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder_var_seq___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->clk = VL_RAND_RESET_I(1);
    vlSelf->rst_n = VL_RAND_RESET_I(1);
    vlSelf->i_valid = VL_RAND_RESET_I(2);
    vlSelf->i_data = VL_RAND_RESET_I(32);
    vlSelf->o_valid = VL_RAND_RESET_I(1);
    vlSelf->o_data = VL_RAND_RESET_I(17);
    vlSelf->i_en = VL_RAND_RESET_I(1);
    vlSelf->adder_var_seq__DOT__calcuate_en = VL_RAND_RESET_I(1);
    vlSelf->adder_var_seq__DOT__o_data_inner = VL_RAND_RESET_I(17);
    vlSelf->adder_var_seq__DOT__o_valid_inner = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigrprev__TOP__clk = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigrprev__TOP__rst_n = VL_RAND_RESET_I(1);
}
