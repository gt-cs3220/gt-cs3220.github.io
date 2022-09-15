######################################################################
#
# DESCRIPTION: Verilator Example: Small Makefile
#
# This calls the object directory makefile.  That allows the objects to
# be placed in the "current directory" which simplifies the Makefile.
#
# Copyright 2003-2018 by Wilson Snyder. This program is free software; you can
# redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.
#
######################################################################
# Check for sanity to avoid later confusion

ifneq ($(words $(CURDIR)),1)
 $(error Unsupported: GNU Make cannot build in directories containing spaces, build elsewhere: '$(CURDIR)')
endif

######################################################################

# This is intended to be a minimal example.  Before copying this to start a
# real project, it is better to start with a more complete example,
# e.g. examples/tracing_c.

# If $VERILATOR_ROOT isn't in the environment, we assume it is part of a
# package inatall, and verilator is in your path. Otherwise find the
# binary relative to $VERILATOR_ROOT (such as when inside the git sources).
ifeq ($(VERILATOR_ROOT),)
VERILATOR = verilator
else
export VERILATOR_ROOT
VERILATOR = $(VERILATOR_ROOT)/bin/verilator
endif


ifdef IDMEMINITFILE
	CXXFLAGS += -DIDMEMINITFILE=$(IDMEMINITFILE)
endif

VX_DEFINE = $(PWD)/define.vh
SED_STRING = 's|define IDMEMINITFILE.*|define IDMEMINITFILE "$(IDMEMINITFILE)"|g' 
VL_FLAGS += --exe -cc pipeline.v --top-module pipeline --trace --trace-structs
CXXFLAGS += -DVCD_OUTPUT -DDPRINTF
LDFLAGS += 

default:
	@echo "-- VERILATE ----------------"
	$(VERILATOR) $(VL_FLAGS) sim_main.cpp fe_stage.v de_stage.v mem_stage.v wb_stage.v agex_stage.v -CFLAGS '$(CXXFLAGS)'
	@echo "-- COMPILE -----------------"
	$(MAKE) -j 4 -C obj_dir -f Vpipeline.mk 
	@echo "-- RUN ---------------------"
	obj_dir/Vpipeline
	@echo "-- DONE --------------------"
	
tests:
	@echo "-- VERILATE ----------------"
	@echo $(IDMEMINITFILE)
	@echo $(VX_DEFINE)
	sed -i $(SED_STRING) $(VX_DEFINE)
	$(VERILATOR) $(VL_FLAGS) sim_main.cpp fe_stage.v de_stage.v mem_stage.v wb_stage.v agex_stage.v -CFLAGS '$(CXXFLAGS)'
	@echo "-- COMPILE -----------------"
	$(MAKE) -j 4 -C obj_dir -f Vpipeline.mk
	@echo "-- RUN ---------------------"
	obj_dir/Vpipeline
	@echo "-- DONE --------------------"

submit: 
	@echo "-- ZIPPING ALL THE FILE ---------"
	zip submission.zip ./*.v ./*.h ./*.vh ./sim_main.cpp ./Makefile

maintainer-copy::
clean mostlyclean distclean maintainer-clean::
	-rm -rf obj_dir *.log *.dmp *.vpd core trace.vcd
