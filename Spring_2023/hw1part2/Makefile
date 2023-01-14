######################################################################
# Check for sanity to avoid later confusion

.PHONY: install test

install:
	@echo "-- Install Prerequisitics ----------------"
	sudo apt-get install git perl python3 make autoconf g++ flex bison ccache
	sudo apt-get install libgoogle-perftools-dev numactl perl-doc
	sudo apt-get install libfl2  # Ubuntu only (ignore if gives error)
	sudo apt-get install libfl-dev  # Ubuntu only (ignore if gives error)
	sudo apt-get install zlibc zlib1g zlib1g-dev  # Ubuntu only (ignore if gives error)
	
	@echo "-- Download Verilator ----------------"
	git clone https://github.com/verilator/verilator   # Only first time

	@echo "-- Installing Verilator ----------------"
	unsetenv VERILATOR_ROOT  # For csh; ignore error if on bash
	unset VERILATOR_ROOT  # For bash
	cd verilator

	autoconf         # Create ./configure script
	./configure      # Configure and create Makefile
	make -j `nproc`  # Build Verilator itself (if error, try just 'make'), which takes 5 minutes on Intel 10-gen i7 (12 threadings)
	sudo make install

	@echo "-- Installing GTKWave"
	sudo apt install gtkwave

test: 
	@echo "-- Testing Verilator using given adder_var_seq.v --"
	verilator --cc adder_var_seq.v --top-module adder_var_seq
	verilator -Wall --trace --exe --build -cc adder_var_seq.cpp adder_var_seq.v
	./obj_dir/Vadder_var_seq

clean:
	rm -rf obj_dir waveform.vcd