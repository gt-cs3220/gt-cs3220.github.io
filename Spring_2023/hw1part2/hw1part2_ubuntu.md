# HW1Part2
## system requirment
OS: Ubuntu 20.04,

## Install all related prerequistics

### Install the verilator
Note that "all prerequistics need to be installed" 

Go to [link](https://verilator.org/guide/latest/install.html#git-quick-install)
Follow the steps to install the prerequistics

```
sudo apt-get install git perl python3 make autoconf g++ flex bison ccache
sudo apt-get install libgoogle-perftools-dev numactl perl-doc
sudo apt-get install libfl2  # Ubuntu only (ignore if gives error)
sudo apt-get install libfl-dev  # Ubuntu only (ignore if gives error)
sudo apt-get install zlibc zlib1g zlib1g-dev  # Ubuntu only (ignore if gives error)

git clone https://github.com/verilator/verilator   # Only first time

unsetenv VERILATOR_ROOT  # For csh; ignore error if on bash
unset VERILATOR_ROOT  # For bash
cd verilator

autoconf         # Create ./configure script
./configure      # Configure and create Makefile
make -j `nproc`  # Build Verilator itself (if error, try just 'make'), which takes 5 minutes on Intel 10-gen i7 (12 threadings)
sudo make install
```

### Install the GTKwave
```
sudo apt install gtkwave
```


## Ready to run?
Step 0: go back to parent directory and then download the testing file from repo 
```
cd ~
git clone https://github.com/gt-cs3220/gt-cs3220.github.io
```

Step 1: compile the verilog module of **adder_var_seq**. 
```
cd gt-cs3220.github.io/Spring_2023/hw1part2/
verilator --cc adder_var_seq.v --top-module adder_var_seq
```

Step 2: Create the Cpp simulation file for Verilator. Pls take a look at the **adder_var_seq.cpp** in the current folder. The detail explainations are listed inside the **adder_var_seq.cpp**.

Step 3: Compile the executable file
```
verilator -Wall --trace --exe --build -cc adder_var_seq.cpp adder_var_seq.v
```

Step 4: Run the exectuable file and obtain the waveform file (.vcd)
```
./obj_dir/Vadder_var_seq
```

Step 5: Open the GTKWaver to open the generated trace
open "GTKWaver" -> "Open New Tab" -> "Select the generated waveform.vcd" -> "click on Top" -> "Right click the signals below" -> "Recurse Import" -> "Append" 
Then all waveforms will show up in the Waves window.
