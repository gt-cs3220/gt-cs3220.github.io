// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vadder_var_seq__Syms.h"


VL_ATTR_COLD void Vadder_var_seq___024root__trace_init_sub__TOP__0(Vadder_var_seq___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vadder_var_seq__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder_var_seq___024root__trace_init_sub__TOP__0\n"); );
    // Init
    const int c = vlSymsp->__Vm_baseCode;
    // Body
    tracep->declBit(c+1,"clk", false,-1);
    tracep->declBit(c+2,"rst_n", false,-1);
    tracep->declBus(c+3,"i_data", false,-1, 31,0);
    tracep->declBus(c+4,"i_valid", false,-1, 1,0);
    tracep->declBus(c+5,"o_data", false,-1, 16,0);
    tracep->declBit(c+6,"o_valid", false,-1);
    tracep->declBit(c+7,"i_en", false,-1);
    tracep->pushNamePrefix("adder_var_seq ");
    tracep->declBus(c+13,"DATA_WIDTH", false,-1, 31,0);
    tracep->declBit(c+1,"clk", false,-1);
    tracep->declBit(c+2,"rst_n", false,-1);
    tracep->declBus(c+3,"i_data", false,-1, 31,0);
    tracep->declBus(c+4,"i_valid", false,-1, 1,0);
    tracep->declBus(c+5,"o_data", false,-1, 16,0);
    tracep->declBit(c+6,"o_valid", false,-1);
    tracep->declBit(c+7,"i_en", false,-1);
    tracep->declBit(c+8,"calcuate_en", false,-1);
    tracep->declBus(c+9,"o_data_inner", false,-1, 16,0);
    tracep->declBit(c+10,"o_valid_inner", false,-1);
    tracep->declBus(c+11,"i_data_extend0", false,-1, 16,0);
    tracep->declBus(c+12,"i_data_extend1", false,-1, 16,0);
    tracep->popNamePrefix(1);
}

VL_ATTR_COLD void Vadder_var_seq___024root__trace_init_top(Vadder_var_seq___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vadder_var_seq__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder_var_seq___024root__trace_init_top\n"); );
    // Body
    Vadder_var_seq___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void Vadder_var_seq___024root__trace_full_top_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void Vadder_var_seq___024root__trace_chg_top_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void Vadder_var_seq___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/);

VL_ATTR_COLD void Vadder_var_seq___024root__trace_register(Vadder_var_seq___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vadder_var_seq__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder_var_seq___024root__trace_register\n"); );
    // Body
    tracep->addFullCb(&Vadder_var_seq___024root__trace_full_top_0, vlSelf);
    tracep->addChgCb(&Vadder_var_seq___024root__trace_chg_top_0, vlSelf);
    tracep->addCleanupCb(&Vadder_var_seq___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void Vadder_var_seq___024root__trace_full_sub_0(Vadder_var_seq___024root* vlSelf, VerilatedVcd::Buffer* bufp);

VL_ATTR_COLD void Vadder_var_seq___024root__trace_full_top_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder_var_seq___024root__trace_full_top_0\n"); );
    // Init
    Vadder_var_seq___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vadder_var_seq___024root*>(voidSelf);
    Vadder_var_seq__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    Vadder_var_seq___024root__trace_full_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void Vadder_var_seq___024root__trace_full_sub_0(Vadder_var_seq___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    Vadder_var_seq__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder_var_seq___024root__trace_full_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    // Body
    bufp->fullBit(oldp+1,(vlSelf->clk));
    bufp->fullBit(oldp+2,(vlSelf->rst_n));
    bufp->fullIData(oldp+3,(vlSelf->i_data),32);
    bufp->fullCData(oldp+4,(vlSelf->i_valid),2);
    bufp->fullIData(oldp+5,(vlSelf->o_data),17);
    bufp->fullBit(oldp+6,(vlSelf->o_valid));
    bufp->fullBit(oldp+7,(vlSelf->i_en));
    bufp->fullBit(oldp+8,(vlSelf->adder_var_seq__DOT__calcuate_en));
    bufp->fullIData(oldp+9,(vlSelf->adder_var_seq__DOT__o_data_inner),17);
    bufp->fullBit(oldp+10,(vlSelf->adder_var_seq__DOT__o_valid_inner));
    bufp->fullIData(oldp+11,(((0x10000U & (vlSelf->i_data 
                                           << 1U)) 
                              | (0xffffU & vlSelf->i_data))),17);
    bufp->fullIData(oldp+12,(((0x10000U & (vlSelf->i_data 
                                           >> 0xfU)) 
                              | (vlSelf->i_data >> 0x10U))),17);
    bufp->fullIData(oldp+13,(0x10U),32);
}
