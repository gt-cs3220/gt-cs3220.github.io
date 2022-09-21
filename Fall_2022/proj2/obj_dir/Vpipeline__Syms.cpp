// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table implementation internals

#include "Vpipeline__Syms.h"
#include "Vpipeline.h"
#include "Vpipeline_pipeline.h"
#include "Vpipeline_WB_STAGE.h"



// FUNCTIONS
Vpipeline__Syms::Vpipeline__Syms(Vpipeline* topp, const char* namep)
    // Setup locals
    : __Vm_namep(namep)
    , __Vm_activity(false)
    , __Vm_didInit(false)
    // Setup submodule names
    , TOP__pipeline(Verilated::catName(topp->name(), "pipeline"))
    , TOP__pipeline__my_WB_stage(Verilated::catName(topp->name(), "pipeline.my_WB_stage"))
{
    // Pointer to top level
    TOPp = topp;
    // Setup each module's pointers to their submodules
    TOPp->pipeline = &TOP__pipeline;
    TOPp->pipeline->my_WB_stage = &TOP__pipeline__my_WB_stage;
    // Setup each module's pointer back to symbol table (for public functions)
    TOPp->__Vconfigure(this, true);
    TOP__pipeline.__Vconfigure(this, true);
    TOP__pipeline__my_WB_stage.__Vconfigure(this, true);
    // Setup scopes
    __Vscope_pipeline__my_WB_stage.configure(this, name(), "pipeline.my_WB_stage", "my_WB_stage", VerilatedScope::SCOPE_OTHER);
    // Setup export functions
    for (int __Vfinal=0; __Vfinal<2; __Vfinal++) {
        __Vscope_pipeline__my_WB_stage.varInsert(__Vfinal,"WB_counters", &(TOP__pipeline__my_WB_stage.WB_counters), VLVT_UINT32,VLVD_NODIR|VLVF_PUB_RW,2 ,31,0 ,31,0);
        __Vscope_pipeline__my_WB_stage.varInsert(__Vfinal,"last_WB_value", &(TOP__pipeline__my_WB_stage.last_WB_value), VLVT_UINT32,VLVD_NODIR|VLVF_PUB_RW,2 ,31,0 ,31,0);
    }
}
