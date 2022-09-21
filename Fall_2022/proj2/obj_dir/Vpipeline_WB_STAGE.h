// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vpipeline.h for the primary calling header

#ifndef _VPIPELINE_WB_STAGE_H_
#define _VPIPELINE_WB_STAGE_H_  // guard

#include "verilated_heavy.h"
#include "Vpipeline__Dpi.h"

//==========

class Vpipeline__Syms;
class Vpipeline_VerilatedVcd;


//----------

VL_MODULE(Vpipeline_WB_STAGE) {
  public:
    
    // PORTS
    VL_IN8(__PVT__clk,0,0);
    VL_IN8(__PVT__reset,0,0);
    VL_OUT8(__PVT__from_WB_to_FE,0,0);
    VL_OUT8(__PVT__from_WB_to_AGEX,0,0);
    VL_OUT8(__PVT__from_WB_to_MEM,0,0);
    VL_INW(__PVT__from_MEM_latch,137,0,5);
    VL_OUT64(__PVT__from_WB_to_DE,54,0);
    
    // LOCAL SIGNALS
    CData/*0:0*/ __PVT__wr_reg_WB;
    CData/*4:0*/ __PVT__wregno_WB;
    CData/*3:0*/ __PVT__wcsrno_WB;
    CData/*0:0*/ __PVT__wr_csr_WB;
    IData/*31:0*/ __PVT__regval_WB;
    IData/*31:0*/ last_WB_value[32];
    IData/*31:0*/ WB_counters[32];
    
    // INTERNAL VARIABLES
  private:
    Vpipeline__Syms* __VlSymsp;  // Symbol table
  public:
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(Vpipeline_WB_STAGE);  ///< Copying not allowed
  public:
    Vpipeline_WB_STAGE(const char* name = "TOP");
    ~Vpipeline_WB_STAGE();
    
    // INTERNAL METHODS
    void __Vconfigure(Vpipeline__Syms* symsp, bool first);
  private:
    void _ctor_var_reset() VL_ATTR_COLD;
  public:
    static void _sequent__TOP__pipeline__my_WB_stage__1(Vpipeline__Syms* __restrict vlSymsp);
    static void _sequent__TOP__pipeline__my_WB_stage__2(Vpipeline__Syms* __restrict vlSymsp);
    static void _sequent__TOP__pipeline__my_WB_stage__3(Vpipeline__Syms* __restrict vlSymsp);
    static void traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
