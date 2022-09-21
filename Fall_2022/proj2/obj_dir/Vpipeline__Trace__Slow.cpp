// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vpipeline__Syms.h"


//======================

void Vpipeline::trace(VerilatedVcdC* tfp, int, int) {
    tfp->spTrace()->addCallback(&Vpipeline::traceInit, &Vpipeline::traceFull, &Vpipeline::traceChg, this);
}
void Vpipeline::traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->open()
    Vpipeline* t = (Vpipeline*)userthis;
    Vpipeline__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (!Verilated::calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
                        "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vcdp->scopeEscape(' ');
    t->traceInitThis(vlSymsp, vcdp, code);
    vcdp->scopeEscape('.');
}
void Vpipeline::traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    Vpipeline* t = (Vpipeline*)userthis;
    Vpipeline__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    t->traceFullThis(vlSymsp, vcdp, code);
}

//======================


void Vpipeline::traceInitThis(Vpipeline__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpipeline* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    vcdp->module(vlSymsp->name());  // Setup signal names
    // Body
    {
        vlTOPp->traceInitThis__1(vlSymsp, vcdp, code);
    }
}

void Vpipeline::traceFullThis(Vpipeline__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpipeline* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vlTOPp->traceFullThis__1(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void Vpipeline::traceInitThis__1(Vpipeline__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpipeline* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->declBit(c+1185,"clk", false,-1);
        vcdp->declBit(c+1193,"reset", false,-1);
        vcdp->declBit(c+1185,"pipeline clk", false,-1);
        vcdp->declBit(c+1193,"pipeline reset", false,-1);
        vcdp->declBus(c+713,"pipeline cycle_count", false,-1, 31,0);
        vcdp->declArray(c+721,"pipeline FE_latch_out", false,-1, 131,0);
        vcdp->declArray(c+761,"pipeline DE_latch_out", false,-1, 201,0);
        vcdp->declArray(c+817,"pipeline AGEX_latch_out", false,-1, 137,0);
        vcdp->declArray(c+857,"pipeline MEM_latch_out", false,-1, 137,0);
        vcdp->declBus(c+17,"pipeline from_DE_to_FE", false,-1, 0,0);
        vcdp->declBus(c+1713,"pipeline from_AGEX_to_FE", false,-1, 0,0);
        vcdp->declBus(c+1721,"pipeline from_MEM_to_FE", false,-1, 0,0);
        vcdp->declBus(c+1729,"pipeline from_WB_to_FE", false,-1, 0,0);
        vcdp->declBus(c+897,"pipeline from_AGEX_to_DE", false,-1, 11,0);
        vcdp->declBus(c+905,"pipeline from_MEM_to_DE", false,-1, 11,0);
        vcdp->declQuad(c+25,"pipeline from_WB_to_DE", false,-1, 54,0);
        vcdp->declBus(c+1737,"pipeline from_MEM_to_AGEX", false,-1, 0,0);
        vcdp->declBus(c+1745,"pipeline from_WB_to_AGEX", false,-1, 0,0);
        vcdp->declBus(c+1753,"pipeline from_WB_to_MEM", false,-1, 0,0);
        vcdp->declBit(c+1185,"pipeline my_FE_stage clk", false,-1);
        vcdp->declBit(c+1193,"pipeline my_FE_stage reset", false,-1);
        vcdp->declBus(c+17,"pipeline my_FE_stage from_DE_to_FE", false,-1, 0,0);
        vcdp->declBus(c+1713,"pipeline my_FE_stage from_AGEX_to_FE", false,-1, 0,0);
        vcdp->declBus(c+1721,"pipeline my_FE_stage from_MEM_to_FE", false,-1, 0,0);
        vcdp->declBus(c+1729,"pipeline my_FE_stage from_WB_to_FE", false,-1, 0,0);
        vcdp->declArray(c+721,"pipeline my_FE_stage FE_latch_out", false,-1, 131,0);
        vcdp->declArray(c+721,"pipeline my_FE_stage FE_latch", false,-1, 131,0);
        vcdp->declBus(c+913,"pipeline my_FE_stage PC_FE_latch", false,-1, 31,0);
        vcdp->declBus(c+41,"pipeline my_FE_stage inst_FE", false,-1, 31,0);
        vcdp->declBus(c+921,"pipeline my_FE_stage pcplus_FE", false,-1, 31,0);
        vcdp->declBit(c+1761,"pipeline my_FE_stage stall_pipe_FE", false,-1);
        vcdp->declArray(c+49,"pipeline my_FE_stage FE_latch_contents", false,-1, 131,0);
        vcdp->declBus(c+929,"pipeline my_FE_stage inst_count_FE", false,-1, 31,0);
        vcdp->declBus(c+1769,"pipeline my_FE_stage inst_count_AGEX", false,-1, 31,0);
        vcdp->declBit(c+1185,"pipeline my_DE_stage clk", false,-1);
        vcdp->declBit(c+1193,"pipeline my_DE_stage reset", false,-1);
        vcdp->declArray(c+721,"pipeline my_DE_stage from_FE_latch", false,-1, 131,0);
        vcdp->declBus(c+897,"pipeline my_DE_stage from_AGEX_to_DE", false,-1, 11,0);
        vcdp->declBus(c+905,"pipeline my_DE_stage from_MEM_to_DE", false,-1, 11,0);
        vcdp->declQuad(c+25,"pipeline my_DE_stage from_WB_to_DE", false,-1, 54,0);
        vcdp->declBus(c+17,"pipeline my_DE_stage from_DE_to_FE", false,-1, 0,0);
        vcdp->declArray(c+761,"pipeline my_DE_stage DE_latch_out", false,-1, 201,0);
        vcdp->declArray(c+761,"pipeline my_DE_stage DE_latch", false,-1, 201,0);
        {int i; for (i=0; i<32; i++) {
                vcdp->declBus(c+313+i*1,"pipeline my_DE_stage regs", true,(i+0), 31,0);}}
        {int i; for (i=0; i<16; i++) {
                vcdp->declBus(c+569+i*1,"pipeline my_DE_stage csr_regs", true,(i+0), 31,0);}}
        vcdp->declBus(c+937,"pipeline my_DE_stage inst_DE", false,-1, 31,0);
        vcdp->declBus(c+945,"pipeline my_DE_stage PC_DE", false,-1, 31,0);
        vcdp->declBus(c+953,"pipeline my_DE_stage pcplus_DE", false,-1, 31,0);
        vcdp->declBus(c+961,"pipeline my_DE_stage inst_count_DE", false,-1, 31,0);
        vcdp->declArray(c+257,"pipeline my_DE_stage DE_latch_contents", false,-1, 201,0);
        vcdp->declBus(c+969,"pipeline my_DE_stage bus_canary_DE", false,-1, 3,0);
        vcdp->declBus(c+977,"pipeline my_DE_stage F3_DE", false,-1, 2,0);
        vcdp->declBus(c+985,"pipeline my_DE_stage F7_DE", false,-1, 6,0);
        vcdp->declBus(c+993,"pipeline my_DE_stage op_DE", false,-1, 6,0);
        vcdp->declBus(c+89,"pipeline my_DE_stage op_I_DE", false,-1, 5,0);
        vcdp->declBus(c+97,"pipeline my_DE_stage type_I_DE", false,-1, 3,0);
        vcdp->declBus(c+105,"pipeline my_DE_stage type_immediate_DE", false,-1, 2,0);
        vcdp->declBus(c+113,"pipeline my_DE_stage sxt_imm_DE", false,-1, 31,0);
        vcdp->declBus(c+697,"pipeline my_DE_stage regword_1", false,-1, 31,0);
        vcdp->declBus(c+705,"pipeline my_DE_stage regword_2", false,-1, 31,0);
        vcdp->declBit(c+121,"pipeline my_DE_stage wr_reg_WB", false,-1);
        vcdp->declBus(c+129,"pipeline my_DE_stage wregno_WB", false,-1, 4,0);
        vcdp->declBus(c+137,"pipeline my_DE_stage regval_WB", false,-1, 31,0);
        vcdp->declBus(c+145,"pipeline my_DE_stage wcsrno_WB", false,-1, 3,0);
        vcdp->declBit(c+153,"pipeline my_DE_stage wr_csr_WB", false,-1);
        vcdp->declBus(c+161,"pipeline my_DE_stage wb_op", false,-1, 6,0);
        vcdp->declBus(c+169,"pipeline my_DE_stage wb_write_to", false,-1, 4,0);
        vcdp->declBus(c+1001,"pipeline my_DE_stage mem_op", false,-1, 6,0);
        vcdp->declBus(c+1009,"pipeline my_DE_stage mem_write_to", false,-1, 4,0);
        vcdp->declBus(c+1001,"pipeline my_DE_stage agex_op", false,-1, 6,0);
        vcdp->declBus(c+1009,"pipeline my_DE_stage agex_write_to", false,-1, 4,0);
        vcdp->declBit(c+17,"pipeline my_DE_stage pipeline_stall_DE", false,-1);
        vcdp->declBus(c+1,"pipeline my_DE_stage unnamedblk1 i", false,-1, 31,0);
        vcdp->declBus(c+9,"pipeline my_DE_stage unnamedblk2 i", false,-1, 31,0);
        vcdp->declBit(c+1185,"pipeline my_AGEX_stage clk", false,-1);
        vcdp->declBit(c+1193,"pipeline my_AGEX_stage reset", false,-1);
        vcdp->declBus(c+1737,"pipeline my_AGEX_stage from_MEM_to_AGEX", false,-1, 0,0);
        vcdp->declBus(c+1745,"pipeline my_AGEX_stage from_WB_to_AGEX", false,-1, 0,0);
        vcdp->declArray(c+761,"pipeline my_AGEX_stage from_DE_latch", false,-1, 201,0);
        vcdp->declArray(c+817,"pipeline my_AGEX_stage AGEX_latch_out", false,-1, 137,0);
        vcdp->declBus(c+1713,"pipeline my_AGEX_stage from_AGEX_to_FE", false,-1, 0,0);
        vcdp->declBus(c+897,"pipeline my_AGEX_stage from_AGEX_to_DE", false,-1, 11,0);
        vcdp->declArray(c+817,"pipeline my_AGEX_stage AGEX_latch", false,-1, 137,0);
        vcdp->declArray(c+177,"pipeline my_AGEX_stage AGEX_latch_contents", false,-1, 137,0);
        vcdp->declBus(c+1017,"pipeline my_AGEX_stage inst_AGEX", false,-1, 31,0);
        vcdp->declBus(c+1025,"pipeline my_AGEX_stage PC_AGEX", false,-1, 31,0);
        vcdp->declBus(c+1033,"pipeline my_AGEX_stage inst_count_AGEX", false,-1, 31,0);
        vcdp->declBus(c+1041,"pipeline my_AGEX_stage pcplus_AGEX", false,-1, 31,0);
        vcdp->declBus(c+1049,"pipeline my_AGEX_stage op_I_AGEX", false,-1, 5,0);
        vcdp->declBit(c+1057,"pipeline my_AGEX_stage br_cond_AGEX", false,-1);
        vcdp->declBus(c+1065,"pipeline my_AGEX_stage regword_1", false,-1, 31,0);
        vcdp->declBus(c+1073,"pipeline my_AGEX_stage regword_2", false,-1, 31,0);
        vcdp->declBus(c+1081,"pipeline my_AGEX_stage bus_canary_AGEX", false,-1, 3,0);
        vcdp->declBus(c+217,"pipeline my_AGEX_stage result", false,-1, 31,0);
        vcdp->declBit(c+1185,"pipeline my_MEM_stage clk", false,-1);
        vcdp->declBit(c+1193,"pipeline my_MEM_stage reset", false,-1);
        vcdp->declBus(c+1753,"pipeline my_MEM_stage from_WB_to_MEM", false,-1, 0,0);
        vcdp->declArray(c+817,"pipeline my_MEM_stage from_AGEX_latch", false,-1, 137,0);
        vcdp->declArray(c+857,"pipeline my_MEM_stage MEM_latch_out", false,-1, 137,0);
        vcdp->declBus(c+1721,"pipeline my_MEM_stage from_MEM_to_FE", false,-1, 0,0);
        vcdp->declBus(c+905,"pipeline my_MEM_stage from_MEM_to_DE", false,-1, 11,0);
        vcdp->declBus(c+1737,"pipeline my_MEM_stage from_MEM_to_AGEX", false,-1, 0,0);
        vcdp->declArray(c+857,"pipeline my_MEM_stage MEM_latch", false,-1, 137,0);
        vcdp->declArray(c+817,"pipeline my_MEM_stage MEM_latch_contents", false,-1, 137,0);
        vcdp->declBus(c+1089,"pipeline my_MEM_stage op_I_MEM", false,-1, 5,0);
        vcdp->declBus(c+1097,"pipeline my_MEM_stage inst_count_MEM", false,-1, 31,0);
        vcdp->declBus(c+1105,"pipeline my_MEM_stage inst_MEM", false,-1, 31,0);
        vcdp->declBus(c+1113,"pipeline my_MEM_stage PC_MEM", false,-1, 31,0);
        vcdp->declBus(c+1121,"pipeline my_MEM_stage result", false,-1, 31,0);
        vcdp->declBus(c+1129,"pipeline my_MEM_stage bus_canary_MEM", false,-1, 3,0);
        vcdp->declBus(c+1777,"pipeline my_MEM_stage memaddr_MEM", false,-1, 31,0);
        vcdp->declBus(c+225,"pipeline my_MEM_stage rd_val_MEM", false,-1, 31,0);
        vcdp->declBus(c+1785,"pipeline my_MEM_stage wr_val_MEM", false,-1, 31,0);
        vcdp->declBit(c+1793,"pipeline my_MEM_stage wr_mem_MEM", false,-1);
        vcdp->declBit(c+1185,"pipeline my_WB_stage clk", false,-1);
        vcdp->declBit(c+1193,"pipeline my_WB_stage reset", false,-1);
        vcdp->declArray(c+857,"pipeline my_WB_stage from_MEM_latch", false,-1, 137,0);
        vcdp->declBus(c+1729,"pipeline my_WB_stage from_WB_to_FE", false,-1, 0,0);
        vcdp->declQuad(c+25,"pipeline my_WB_stage from_WB_to_DE", false,-1, 54,0);
        vcdp->declBus(c+1745,"pipeline my_WB_stage from_WB_to_AGEX", false,-1, 0,0);
        vcdp->declBus(c+1753,"pipeline my_WB_stage from_WB_to_MEM", false,-1, 0,0);
        vcdp->declBus(c+1137,"pipeline my_WB_stage op_I_WB", false,-1, 5,0);
        vcdp->declBus(c+1145,"pipeline my_WB_stage inst_WB", false,-1, 31,0);
        vcdp->declBus(c+1153,"pipeline my_WB_stage PC_WB", false,-1, 31,0);
        vcdp->declBus(c+1161,"pipeline my_WB_stage inst_count_WB", false,-1, 31,0);
        vcdp->declBus(c+1169,"pipeline my_WB_stage result", false,-1, 31,0);
        vcdp->declBus(c+1177,"pipeline my_WB_stage bus_canary_WB", false,-1, 3,0);
        vcdp->declBit(c+233,"pipeline my_WB_stage wr_reg_WB", false,-1);
        vcdp->declBus(c+241,"pipeline my_WB_stage wregno_WB", false,-1, 4,0);
        vcdp->declBus(c+249,"pipeline my_WB_stage regval_WB", false,-1, 31,0);
        vcdp->declBus(c+1801,"pipeline my_WB_stage wcsrno_WB", false,-1, 3,0);
        vcdp->declBit(c+1809,"pipeline my_WB_stage wr_csr_WB", false,-1);
        {int i; for (i=0; i<32; i++) {
                vcdp->declBus(c+1201+i*1,"pipeline my_WB_stage last_WB_value", true,(i+0), 31,0);}}
        {int i; for (i=0; i<32; i++) {
                vcdp->declBus(c+1457+i*1,"pipeline my_WB_stage WB_counters", true,(i+0), 31,0);}}
    }
}

void Vpipeline::traceFullThis__1(Vpipeline__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpipeline* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Variables
    WData/*159:0*/ __Vtemp3[5];
    WData/*159:0*/ __Vtemp6[5];
    WData/*223:0*/ __Vtemp11[7];
    // Body
    {
        vcdp->fullBus(c+1,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__unnamedblk1__DOT__i),32);
        vcdp->fullBus(c+9,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__unnamedblk2__DOT__i),32);
        vcdp->fullBit(c+17,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__pipeline_stall_DE));
        vcdp->fullQuad(c+25,(vlSymsp->TOP__pipeline__my_WB_stage.__PVT__from_WB_to_DE),55);
        vcdp->fullBus(c+41,(vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__imem
                            [(0x3fffU & (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__PC_FE_latch 
                                         >> 2U))]),32);
        __Vtemp3[0U] = (0xfU | (0xfffffff0U & (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__inst_count_FE 
                                               << 4U)));
        __Vtemp3[1U] = ((0xfU & (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__inst_count_FE 
                                 >> 0x1cU)) | (0xfffffff0U 
                                               & (((IData)(4U) 
                                                   + vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__PC_FE_latch) 
                                                  << 4U)));
        __Vtemp3[2U] = ((0xfU & (((IData)(4U) + vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__PC_FE_latch) 
                                 >> 0x1cU)) | (0xfffffff0U 
                                               & ((IData)(
                                                          (((QData)((IData)(
                                                                            vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__imem
                                                                            [
                                                                            (0x3fffU 
                                                                             & (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__PC_FE_latch 
                                                                                >> 2U))])) 
                                                            << 0x20U) 
                                                           | (QData)((IData)(vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__PC_FE_latch)))) 
                                                  << 4U)));
        __Vtemp3[3U] = ((0xfU & ((IData)((((QData)((IData)(
                                                           vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__imem
                                                           [
                                                           (0x3fffU 
                                                            & (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__PC_FE_latch 
                                                               >> 2U))])) 
                                           << 0x20U) 
                                          | (QData)((IData)(vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__PC_FE_latch)))) 
                                 >> 0x1cU)) | (0xfffffff0U 
                                               & ((IData)(
                                                          ((((QData)((IData)(
                                                                             vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__imem
                                                                             [
                                                                             (0x3fffU 
                                                                              & (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__PC_FE_latch 
                                                                                >> 2U))])) 
                                                             << 0x20U) 
                                                            | (QData)((IData)(vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__PC_FE_latch))) 
                                                           >> 0x20U)) 
                                                  << 4U)));
        __Vtemp3[4U] = (0xfU & ((IData)(((((QData)((IData)(
                                                           vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__imem
                                                           [
                                                           (0x3fffU 
                                                            & (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__PC_FE_latch 
                                                               >> 2U))])) 
                                           << 0x20U) 
                                          | (QData)((IData)(vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__PC_FE_latch))) 
                                         >> 0x20U)) 
                                >> 0x1cU));
        vcdp->fullArray(c+49,(__Vtemp3),132);
        vcdp->fullBus(c+89,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__op_I_DE),6);
        vcdp->fullBus(c+97,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__type_I_DE),4);
        vcdp->fullBus(c+105,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__type_immediate_DE),3);
        vcdp->fullBus(c+113,(((1U == (IData)(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__type_immediate_DE))
                               ? ((0xfffff800U & (VL_NEGATE_I((IData)(
                                                                      (1U 
                                                                       & (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[4U] 
                                                                          >> 3U)))) 
                                                  << 0xbU)) 
                                  | (0x7ffU & ((vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[4U] 
                                                << 8U) 
                                               | (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[3U] 
                                                  >> 0x18U))))
                               : 0U)),32);
        vcdp->fullBit(c+121,((1U & (IData)((vlSymsp->TOP__pipeline__my_WB_stage.__PVT__from_WB_to_DE 
                                            >> 0x36U)))));
        vcdp->fullBus(c+129,((0x1fU & (IData)((vlSymsp->TOP__pipeline__my_WB_stage.__PVT__from_WB_to_DE 
                                               >> 0x31U)))),5);
        vcdp->fullBus(c+137,((IData)((vlSymsp->TOP__pipeline__my_WB_stage.__PVT__from_WB_to_DE 
                                      >> 0x11U))),32);
        vcdp->fullBus(c+145,((0xfU & (IData)((vlSymsp->TOP__pipeline__my_WB_stage.__PVT__from_WB_to_DE 
                                              >> 0xdU)))),4);
        vcdp->fullBit(c+153,((1U & (IData)((vlSymsp->TOP__pipeline__my_WB_stage.__PVT__from_WB_to_DE 
                                            >> 0xcU)))));
        vcdp->fullBus(c+161,((0x7fU & (IData)(vlSymsp->TOP__pipeline__my_WB_stage.__PVT__from_WB_to_DE))),7);
        vcdp->fullBus(c+169,((0x1fU & (IData)((vlSymsp->TOP__pipeline__my_WB_stage.__PVT__from_WB_to_DE 
                                               >> 7U)))),5);
        __Vtemp6[0U] = ((0xfffffff0U & ((IData)((((QData)((IData)(
                                                                  ((vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[3U] 
                                                                    << 0x1cU) 
                                                                   | (vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[2U] 
                                                                      >> 4U)))) 
                                                  << 0x20U) 
                                                 | (QData)((IData)(vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__result)))) 
                                        << 4U)) | (0xfU 
                                                   & vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[0U]));
        __Vtemp6[1U] = ((0xfU & ((IData)((((QData)((IData)(
                                                           ((vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[3U] 
                                                             << 0x1cU) 
                                                            | (vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[2U] 
                                                               >> 4U)))) 
                                           << 0x20U) 
                                          | (QData)((IData)(vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__result)))) 
                                 >> 0x1cU)) | (0xfffffff0U 
                                               & ((IData)(
                                                          ((((QData)((IData)(
                                                                             ((vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[3U] 
                                                                               << 0x1cU) 
                                                                              | (vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[2U] 
                                                                                >> 4U)))) 
                                                             << 0x20U) 
                                                            | (QData)((IData)(vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__result))) 
                                                           >> 0x20U)) 
                                                  << 4U)));
        __Vtemp6[2U] = ((0xfffffc00U & ((IData)((((QData)((IData)(
                                                                  vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[6U])) 
                                                  << 0x36U) 
                                                 | (((QData)((IData)(
                                                                     vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[5U])) 
                                                     << 0x16U) 
                                                    | ((QData)((IData)(
                                                                       vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[4U])) 
                                                       >> 0xaU)))) 
                                        << 0xaU)) | 
                        ((0x3f0U & vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[3U]) 
                         | (0xfU & ((IData)(((((QData)((IData)(
                                                               ((vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[3U] 
                                                                 << 0x1cU) 
                                                                | (vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[2U] 
                                                                   >> 4U)))) 
                                               << 0x20U) 
                                              | (QData)((IData)(vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__result))) 
                                             >> 0x20U)) 
                                    >> 0x1cU))));
        __Vtemp6[3U] = ((0x3ffU & ((IData)((((QData)((IData)(
                                                             vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[6U])) 
                                             << 0x36U) 
                                            | (((QData)((IData)(
                                                                vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[5U])) 
                                                << 0x16U) 
                                               | ((QData)((IData)(
                                                                  vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[4U])) 
                                                  >> 0xaU)))) 
                                   >> 0x16U)) | (0xfffffc00U 
                                                 & ((IData)(
                                                            ((((QData)((IData)(
                                                                               vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[6U])) 
                                                               << 0x36U) 
                                                              | (((QData)((IData)(
                                                                                vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[5U])) 
                                                                  << 0x16U) 
                                                                 | ((QData)((IData)(
                                                                                vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[4U])) 
                                                                    >> 0xaU))) 
                                                             >> 0x20U)) 
                                                    << 0xaU)));
        __Vtemp6[4U] = (0x3ffU & ((IData)(((((QData)((IData)(
                                                             vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[6U])) 
                                             << 0x36U) 
                                            | (((QData)((IData)(
                                                                vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[5U])) 
                                                << 0x16U) 
                                               | ((QData)((IData)(
                                                                  vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[4U])) 
                                                  >> 0xaU))) 
                                           >> 0x20U)) 
                                  >> 0x16U));
        vcdp->fullArray(c+177,(__Vtemp6),138);
        vcdp->fullBus(c+217,(vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__result),32);
        vcdp->fullBus(c+225,(vlSymsp->TOP__pipeline.__PVT__my_MEM_stage__DOT__dmem
                             [(0x3fffU & (vlSymsp->TOP__pipeline.__PVT__my_MEM_stage__DOT__memaddr_MEM 
                                          >> 2U))]),32);
        vcdp->fullBit(c+233,(vlSymsp->TOP__pipeline__my_WB_stage.__PVT__wr_reg_WB));
        vcdp->fullBus(c+241,(vlSymsp->TOP__pipeline__my_WB_stage.__PVT__wregno_WB),5);
        vcdp->fullBus(c+249,(vlSymsp->TOP__pipeline__my_WB_stage.__PVT__regval_WB),32);
        __Vtemp11[0U] = ((0xfffffff0U & (vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regword_2 
                                         << 4U)) | 
                         (0xfU & vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[0U]));
        __Vtemp11[1U] = ((0xfU & (vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regword_2 
                                  >> 0x1cU)) | (0xfffffff0U 
                                                & ((IData)(
                                                           (((QData)((IData)(
                                                                             ((vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[1U] 
                                                                               << 0x1cU) 
                                                                              | (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[0U] 
                                                                                >> 4U)))) 
                                                             << 0x20U) 
                                                            | (QData)((IData)(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regword_1)))) 
                                                   << 4U)));
        __Vtemp11[2U] = ((0xfU & ((IData)((((QData)((IData)(
                                                            ((vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[1U] 
                                                              << 0x1cU) 
                                                             | (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[0U] 
                                                                >> 4U)))) 
                                            << 0x20U) 
                                           | (QData)((IData)(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regword_1)))) 
                                  >> 0x1cU)) | (0xfffffff0U 
                                                & ((IData)(
                                                           ((((QData)((IData)(
                                                                              ((vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[1U] 
                                                                                << 0x1cU) 
                                                                               | (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[0U] 
                                                                                >> 4U)))) 
                                                              << 0x20U) 
                                                             | (QData)((IData)(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regword_1))) 
                                                            >> 0x20U)) 
                                                   << 4U)));
        __Vtemp11[3U] = ((0xfffffc00U & (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[1U] 
                                         << 6U)) | 
                         ((0xfffffff0U & ((IData)(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__op_I_DE) 
                                          << 4U)) | 
                          (0xfU & ((IData)(((((QData)((IData)(
                                                              ((vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[1U] 
                                                                << 0x1cU) 
                                                               | (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[0U] 
                                                                  >> 4U)))) 
                                              << 0x20U) 
                                             | (QData)((IData)(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regword_1))) 
                                            >> 0x20U)) 
                                   >> 0x1cU))));
        __Vtemp11[4U] = ((0x3ffU & ((0x3c0U & (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[2U] 
                                               << 6U)) 
                                    | (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[1U] 
                                       >> 0x1aU))) 
                         | (0xfffffc00U & (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[2U] 
                                           << 6U)));
        __Vtemp11[5U] = ((0x3ffU & ((0x3c0U & (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[3U] 
                                               << 6U)) 
                                    | (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[2U] 
                                       >> 0x1aU))) 
                         | (0xfffffc00U & (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[3U] 
                                           << 6U)));
        __Vtemp11[6U] = (0x3ffU & ((0x3c0U & (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[4U] 
                                              << 6U)) 
                                   | (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[3U] 
                                      >> 0x1aU)));
        vcdp->fullArray(c+257,(__Vtemp11),202);
        vcdp->fullBus(c+313,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[0]),32);
        vcdp->fullBus(c+314,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[1]),32);
        vcdp->fullBus(c+315,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[2]),32);
        vcdp->fullBus(c+316,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[3]),32);
        vcdp->fullBus(c+317,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[4]),32);
        vcdp->fullBus(c+318,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[5]),32);
        vcdp->fullBus(c+319,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[6]),32);
        vcdp->fullBus(c+320,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[7]),32);
        vcdp->fullBus(c+321,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[8]),32);
        vcdp->fullBus(c+322,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[9]),32);
        vcdp->fullBus(c+323,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[10]),32);
        vcdp->fullBus(c+324,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[11]),32);
        vcdp->fullBus(c+325,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[12]),32);
        vcdp->fullBus(c+326,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[13]),32);
        vcdp->fullBus(c+327,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[14]),32);
        vcdp->fullBus(c+328,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[15]),32);
        vcdp->fullBus(c+329,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[16]),32);
        vcdp->fullBus(c+330,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[17]),32);
        vcdp->fullBus(c+331,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[18]),32);
        vcdp->fullBus(c+332,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[19]),32);
        vcdp->fullBus(c+333,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[20]),32);
        vcdp->fullBus(c+334,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[21]),32);
        vcdp->fullBus(c+335,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[22]),32);
        vcdp->fullBus(c+336,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[23]),32);
        vcdp->fullBus(c+337,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[24]),32);
        vcdp->fullBus(c+338,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[25]),32);
        vcdp->fullBus(c+339,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[26]),32);
        vcdp->fullBus(c+340,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[27]),32);
        vcdp->fullBus(c+341,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[28]),32);
        vcdp->fullBus(c+342,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[29]),32);
        vcdp->fullBus(c+343,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[30]),32);
        vcdp->fullBus(c+344,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regs[31]),32);
        vcdp->fullBus(c+569,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__csr_regs[0]),32);
        vcdp->fullBus(c+570,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__csr_regs[1]),32);
        vcdp->fullBus(c+571,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__csr_regs[2]),32);
        vcdp->fullBus(c+572,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__csr_regs[3]),32);
        vcdp->fullBus(c+573,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__csr_regs[4]),32);
        vcdp->fullBus(c+574,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__csr_regs[5]),32);
        vcdp->fullBus(c+575,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__csr_regs[6]),32);
        vcdp->fullBus(c+576,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__csr_regs[7]),32);
        vcdp->fullBus(c+577,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__csr_regs[8]),32);
        vcdp->fullBus(c+578,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__csr_regs[9]),32);
        vcdp->fullBus(c+579,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__csr_regs[10]),32);
        vcdp->fullBus(c+580,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__csr_regs[11]),32);
        vcdp->fullBus(c+581,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__csr_regs[12]),32);
        vcdp->fullBus(c+582,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__csr_regs[13]),32);
        vcdp->fullBus(c+583,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__csr_regs[14]),32);
        vcdp->fullBus(c+584,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__csr_regs[15]),32);
        vcdp->fullBus(c+697,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regword_1),32);
        vcdp->fullBus(c+705,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__regword_2),32);
        vcdp->fullBus(c+713,(vlSymsp->TOP__pipeline.__PVT__cycle_count),32);
        vcdp->fullArray(c+721,(vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch),132);
        vcdp->fullArray(c+761,(vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch),202);
        vcdp->fullArray(c+817,(vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__AGEX_latch),138);
        vcdp->fullArray(c+857,(vlSymsp->TOP__pipeline.__PVT__my_MEM_stage__DOT__MEM_latch),138);
        vcdp->fullBus(c+897,((0xfffU & ((vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[6U] 
                                         << 0x16U) 
                                        | (vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[5U] 
                                           >> 0xaU)))),12);
        vcdp->fullBus(c+905,((0xfffU & ((vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__AGEX_latch[4U] 
                                         << 0x16U) 
                                        | (vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__AGEX_latch[3U] 
                                           >> 0xaU)))),12);
        vcdp->fullBus(c+913,(vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__PC_FE_latch),32);
        vcdp->fullBus(c+921,(((IData)(4U) + vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__PC_FE_latch)),32);
        vcdp->fullBus(c+929,(vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__inst_count_FE),32);
        vcdp->fullBus(c+937,(((vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[4U] 
                               << 0x1cU) | (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[3U] 
                                            >> 4U))),32);
        vcdp->fullBus(c+945,(((vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[3U] 
                               << 0x1cU) | (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[2U] 
                                            >> 4U))),32);
        vcdp->fullBus(c+953,(((vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[2U] 
                               << 0x1cU) | (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[1U] 
                                            >> 4U))),32);
        vcdp->fullBus(c+961,(((vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[1U] 
                               << 0x1cU) | (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[0U] 
                                            >> 4U))),32);
        vcdp->fullBus(c+969,((0xfU & vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[0U])),4);
        vcdp->fullBus(c+977,((7U & ((vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[4U] 
                                     << 0x10U) | (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[3U] 
                                                  >> 0x10U)))),3);
        vcdp->fullBus(c+985,((0x7fU & ((vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[4U] 
                                        << 3U) | (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[3U] 
                                                  >> 0x1dU)))),7);
        vcdp->fullBus(c+993,((0x7fU & ((vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[4U] 
                                        << 0x1cU) | 
                                       (vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__FE_latch[3U] 
                                        >> 4U)))),7);
        vcdp->fullBus(c+1001,((0x7fU & ((vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__AGEX_latch[4U] 
                                         << 0x16U) 
                                        | (vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__AGEX_latch[3U] 
                                           >> 0xaU)))),7);
        vcdp->fullBus(c+1009,((0x1fU & ((vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__AGEX_latch[4U] 
                                         << 0xfU) | 
                                        (vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__AGEX_latch[3U] 
                                         >> 0x11U)))),5);
        vcdp->fullBus(c+1017,(((vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[6U] 
                                << 0x16U) | (vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[5U] 
                                             >> 0xaU))),32);
        vcdp->fullBus(c+1025,(((vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[5U] 
                                << 0x16U) | (vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[4U] 
                                             >> 0xaU))),32);
        vcdp->fullBus(c+1033,(((vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[3U] 
                                << 0x1cU) | (vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[2U] 
                                             >> 4U))),32);
        vcdp->fullBus(c+1041,(((vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[4U] 
                                << 0x16U) | (vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[3U] 
                                             >> 0xaU))),32);
        vcdp->fullBus(c+1049,((0x3fU & ((vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[4U] 
                                         << 0x1cU) 
                                        | (vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[3U] 
                                           >> 4U)))),6);
        vcdp->fullBit(c+1057,((0x1cU == (0x3fU & ((
                                                   vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[4U] 
                                                   << 0x1cU) 
                                                  | (vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[3U] 
                                                     >> 4U))))));
        vcdp->fullBus(c+1065,(((vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[2U] 
                                << 0x1cU) | (vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[1U] 
                                             >> 4U))),32);
        vcdp->fullBus(c+1073,(((vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[1U] 
                                << 0x1cU) | (vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[0U] 
                                             >> 4U))),32);
        vcdp->fullBus(c+1081,((0xfU & vlSymsp->TOP__pipeline.__PVT__my_DE_stage__DOT__DE_latch[0U])),4);
        vcdp->fullBus(c+1089,((0x3fU & ((vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__AGEX_latch[3U] 
                                         << 0x1cU) 
                                        | (vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__AGEX_latch[2U] 
                                           >> 4U)))),6);
        vcdp->fullBus(c+1097,(((vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__AGEX_latch[2U] 
                                << 0x1cU) | (vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__AGEX_latch[1U] 
                                             >> 4U))),32);
        vcdp->fullBus(c+1105,(((vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__AGEX_latch[4U] 
                                << 0x16U) | (vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__AGEX_latch[3U] 
                                             >> 0xaU))),32);
        vcdp->fullBus(c+1113,(((vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__AGEX_latch[3U] 
                                << 0x16U) | (vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__AGEX_latch[2U] 
                                             >> 0xaU))),32);
        vcdp->fullBus(c+1121,(((vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__AGEX_latch[1U] 
                                << 0x1cU) | (vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__AGEX_latch[0U] 
                                             >> 4U))),32);
        vcdp->fullBus(c+1129,((0xfU & vlSymsp->TOP__pipeline.__PVT__my_AGEX_stage__DOT__AGEX_latch[0U])),4);
        vcdp->fullBus(c+1137,((0x3fU & ((vlSymsp->TOP__pipeline.__PVT__my_MEM_stage__DOT__MEM_latch[3U] 
                                         << 0x1cU) 
                                        | (vlSymsp->TOP__pipeline.__PVT__my_MEM_stage__DOT__MEM_latch[2U] 
                                           >> 4U)))),6);
        vcdp->fullBus(c+1145,(((vlSymsp->TOP__pipeline.__PVT__my_MEM_stage__DOT__MEM_latch[4U] 
                                << 0x16U) | (vlSymsp->TOP__pipeline.__PVT__my_MEM_stage__DOT__MEM_latch[3U] 
                                             >> 0xaU))),32);
        vcdp->fullBus(c+1153,(((vlSymsp->TOP__pipeline.__PVT__my_MEM_stage__DOT__MEM_latch[3U] 
                                << 0x16U) | (vlSymsp->TOP__pipeline.__PVT__my_MEM_stage__DOT__MEM_latch[2U] 
                                             >> 0xaU))),32);
        vcdp->fullBus(c+1161,(((vlSymsp->TOP__pipeline.__PVT__my_MEM_stage__DOT__MEM_latch[2U] 
                                << 0x1cU) | (vlSymsp->TOP__pipeline.__PVT__my_MEM_stage__DOT__MEM_latch[1U] 
                                             >> 4U))),32);
        vcdp->fullBus(c+1169,(((vlSymsp->TOP__pipeline.__PVT__my_MEM_stage__DOT__MEM_latch[1U] 
                                << 0x1cU) | (vlSymsp->TOP__pipeline.__PVT__my_MEM_stage__DOT__MEM_latch[0U] 
                                             >> 4U))),32);
        vcdp->fullBus(c+1177,((0xfU & vlSymsp->TOP__pipeline.__PVT__my_MEM_stage__DOT__MEM_latch[0U])),4);
        vcdp->fullBit(c+1185,(vlTOPp->clk));
        vcdp->fullBit(c+1193,(vlTOPp->reset));
        vcdp->fullBus(c+1201,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[0]),32);
        vcdp->fullBus(c+1202,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[1]),32);
        vcdp->fullBus(c+1203,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[2]),32);
        vcdp->fullBus(c+1204,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[3]),32);
        vcdp->fullBus(c+1205,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[4]),32);
        vcdp->fullBus(c+1206,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[5]),32);
        vcdp->fullBus(c+1207,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[6]),32);
        vcdp->fullBus(c+1208,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[7]),32);
        vcdp->fullBus(c+1209,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[8]),32);
        vcdp->fullBus(c+1210,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[9]),32);
        vcdp->fullBus(c+1211,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[10]),32);
        vcdp->fullBus(c+1212,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[11]),32);
        vcdp->fullBus(c+1213,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[12]),32);
        vcdp->fullBus(c+1214,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[13]),32);
        vcdp->fullBus(c+1215,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[14]),32);
        vcdp->fullBus(c+1216,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[15]),32);
        vcdp->fullBus(c+1217,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[16]),32);
        vcdp->fullBus(c+1218,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[17]),32);
        vcdp->fullBus(c+1219,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[18]),32);
        vcdp->fullBus(c+1220,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[19]),32);
        vcdp->fullBus(c+1221,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[20]),32);
        vcdp->fullBus(c+1222,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[21]),32);
        vcdp->fullBus(c+1223,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[22]),32);
        vcdp->fullBus(c+1224,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[23]),32);
        vcdp->fullBus(c+1225,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[24]),32);
        vcdp->fullBus(c+1226,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[25]),32);
        vcdp->fullBus(c+1227,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[26]),32);
        vcdp->fullBus(c+1228,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[27]),32);
        vcdp->fullBus(c+1229,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[28]),32);
        vcdp->fullBus(c+1230,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[29]),32);
        vcdp->fullBus(c+1231,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[30]),32);
        vcdp->fullBus(c+1232,(vlSymsp->TOP__pipeline__my_WB_stage.last_WB_value[31]),32);
        vcdp->fullBus(c+1457,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[0]),32);
        vcdp->fullBus(c+1458,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[1]),32);
        vcdp->fullBus(c+1459,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[2]),32);
        vcdp->fullBus(c+1460,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[3]),32);
        vcdp->fullBus(c+1461,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[4]),32);
        vcdp->fullBus(c+1462,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[5]),32);
        vcdp->fullBus(c+1463,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[6]),32);
        vcdp->fullBus(c+1464,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[7]),32);
        vcdp->fullBus(c+1465,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[8]),32);
        vcdp->fullBus(c+1466,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[9]),32);
        vcdp->fullBus(c+1467,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[10]),32);
        vcdp->fullBus(c+1468,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[11]),32);
        vcdp->fullBus(c+1469,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[12]),32);
        vcdp->fullBus(c+1470,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[13]),32);
        vcdp->fullBus(c+1471,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[14]),32);
        vcdp->fullBus(c+1472,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[15]),32);
        vcdp->fullBus(c+1473,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[16]),32);
        vcdp->fullBus(c+1474,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[17]),32);
        vcdp->fullBus(c+1475,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[18]),32);
        vcdp->fullBus(c+1476,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[19]),32);
        vcdp->fullBus(c+1477,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[20]),32);
        vcdp->fullBus(c+1478,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[21]),32);
        vcdp->fullBus(c+1479,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[22]),32);
        vcdp->fullBus(c+1480,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[23]),32);
        vcdp->fullBus(c+1481,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[24]),32);
        vcdp->fullBus(c+1482,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[25]),32);
        vcdp->fullBus(c+1483,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[26]),32);
        vcdp->fullBus(c+1484,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[27]),32);
        vcdp->fullBus(c+1485,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[28]),32);
        vcdp->fullBus(c+1486,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[29]),32);
        vcdp->fullBus(c+1487,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[30]),32);
        vcdp->fullBus(c+1488,(vlSymsp->TOP__pipeline__my_WB_stage.WB_counters[31]),32);
        vcdp->fullBit(c+1713,(vlSymsp->TOP__pipeline.__PVT__from_AGEX_to_FE));
        vcdp->fullBit(c+1721,(vlSymsp->TOP__pipeline.__PVT__from_MEM_to_FE));
        vcdp->fullBit(c+1729,(vlSymsp->TOP__pipeline__my_WB_stage.__PVT__from_WB_to_FE));
        vcdp->fullBit(c+1737,(vlSymsp->TOP__pipeline.__PVT__from_MEM_to_AGEX));
        vcdp->fullBit(c+1745,(vlSymsp->TOP__pipeline__my_WB_stage.__PVT__from_WB_to_AGEX));
        vcdp->fullBit(c+1753,(vlSymsp->TOP__pipeline__my_WB_stage.__PVT__from_WB_to_MEM));
        vcdp->fullBit(c+1761,(0U));
        vcdp->fullBus(c+1769,(vlSymsp->TOP__pipeline.__PVT__my_FE_stage__DOT__inst_count_AGEX),32);
        vcdp->fullBus(c+1777,(vlSymsp->TOP__pipeline.__PVT__my_MEM_stage__DOT__memaddr_MEM),32);
        vcdp->fullBus(c+1785,(vlSymsp->TOP__pipeline.__PVT__my_MEM_stage__DOT__wr_val_MEM),32);
        vcdp->fullBit(c+1793,(vlSymsp->TOP__pipeline.__PVT__my_MEM_stage__DOT__wr_mem_MEM));
        vcdp->fullBus(c+1801,(vlSymsp->TOP__pipeline__my_WB_stage.__PVT__wcsrno_WB),4);
        vcdp->fullBit(c+1809,(vlSymsp->TOP__pipeline__my_WB_stage.__PVT__wr_csr_WB));
    }
}
