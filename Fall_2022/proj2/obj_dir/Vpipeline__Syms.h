// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef _VPIPELINE__SYMS_H_
#define _VPIPELINE__SYMS_H_  // guard

#include "verilated_heavy.h"

// INCLUDE MODULE CLASSES
#include "Vpipeline.h"
#include "Vpipeline_pipeline.h"
#include "Vpipeline_WB_STAGE.h"

// DPI TYPES for DPI Export callbacks (Internal use)

// SYMS CLASS
class Vpipeline__Syms : public VerilatedSyms {
  public:
    
    // LOCAL STATE
    const char* __Vm_namep;
    bool __Vm_activity;  ///< Used by trace routines to determine change occurred
    bool __Vm_didInit;
    
    // SUBCELL STATE
    Vpipeline*                     TOPp;
    Vpipeline_pipeline             TOP__pipeline;
    Vpipeline_WB_STAGE             TOP__pipeline__my_WB_stage;
    
    // SCOPE NAMES
    VerilatedScope __Vscope_pipeline__my_WB_stage;
    
    // CREATORS
    Vpipeline__Syms(Vpipeline* topp, const char* namep);
    ~Vpipeline__Syms() {}
    
    // METHODS
    inline const char* name() { return __Vm_namep; }
    inline bool getClearActivity() { bool r=__Vm_activity; __Vm_activity=false; return r; }
    
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
