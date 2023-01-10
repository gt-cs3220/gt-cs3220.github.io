// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vadder_var_seq.h"
#include "Vadder_var_seq__Syms.h"
#include "verilated_vcd_c.h"

//============================================================
// Constructors

Vadder_var_seq::Vadder_var_seq(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vadder_var_seq__Syms(contextp(), _vcname__, this)}
    , clk{vlSymsp->TOP.clk}
    , rst_n{vlSymsp->TOP.rst_n}
    , i_valid{vlSymsp->TOP.i_valid}
    , o_valid{vlSymsp->TOP.o_valid}
    , i_en{vlSymsp->TOP.i_en}
    , i_data{vlSymsp->TOP.i_data}
    , o_data{vlSymsp->TOP.o_data}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vadder_var_seq::Vadder_var_seq(const char* _vcname__)
    : Vadder_var_seq(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vadder_var_seq::~Vadder_var_seq() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vadder_var_seq___024root___eval_debug_assertions(Vadder_var_seq___024root* vlSelf);
#endif  // VL_DEBUG
void Vadder_var_seq___024root___eval_static(Vadder_var_seq___024root* vlSelf);
void Vadder_var_seq___024root___eval_initial(Vadder_var_seq___024root* vlSelf);
void Vadder_var_seq___024root___eval_settle(Vadder_var_seq___024root* vlSelf);
void Vadder_var_seq___024root___eval(Vadder_var_seq___024root* vlSelf);

void Vadder_var_seq::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vadder_var_seq::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vadder_var_seq___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_activity = true;
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vadder_var_seq___024root___eval_static(&(vlSymsp->TOP));
        Vadder_var_seq___024root___eval_initial(&(vlSymsp->TOP));
        Vadder_var_seq___024root___eval_settle(&(vlSymsp->TOP));
    }
    // MTask 0 start
    VL_DEBUG_IF(VL_DBG_MSGF("MTask0 starting\n"););
    Verilated::mtaskId(0);
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vadder_var_seq___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfThreadMTask(vlSymsp->__Vm_evalMsgQp);
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vadder_var_seq::eventsPending() { return false; }

uint64_t Vadder_var_seq::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "%Error: No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vadder_var_seq::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vadder_var_seq___024root___eval_final(Vadder_var_seq___024root* vlSelf);

VL_ATTR_COLD void Vadder_var_seq::final() {
    Vadder_var_seq___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vadder_var_seq::hierName() const { return vlSymsp->name(); }
const char* Vadder_var_seq::modelName() const { return "Vadder_var_seq"; }
unsigned Vadder_var_seq::threads() const { return 1; }
std::unique_ptr<VerilatedTraceConfig> Vadder_var_seq::traceConfig() const {
    return std::unique_ptr<VerilatedTraceConfig>{new VerilatedTraceConfig{false, false, false}};
};

//============================================================
// Trace configuration

void Vadder_var_seq___024root__trace_init_top(Vadder_var_seq___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    Vadder_var_seq___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vadder_var_seq___024root*>(voidSelf);
    Vadder_var_seq__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->scopeEscape(' ');
    tracep->pushNamePrefix(std::string{vlSymsp->name()} + ' ');
    Vadder_var_seq___024root__trace_init_top(vlSelf, tracep);
    tracep->popNamePrefix();
    tracep->scopeEscape('.');
}

VL_ATTR_COLD void Vadder_var_seq___024root__trace_register(Vadder_var_seq___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void Vadder_var_seq::trace(VerilatedVcdC* tfp, int levels, int options) {
    if (tfp->isOpen()) {
        vl_fatal(__FILE__, __LINE__, __FILE__,"'Vadder_var_seq::trace()' shall not be called after 'VerilatedVcdC::open()'.");
    }
    if (false && levels && options) {}  // Prevent unused
    tfp->spTrace()->addModel(this);
    tfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP));
    Vadder_var_seq___024root__trace_register(&(vlSymsp->TOP), tfp->spTrace());
}
