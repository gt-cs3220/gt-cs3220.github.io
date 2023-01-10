# HW1Part2
## system requirment
OS tested: macOS Ventura 13.1

It should theoretically be fine with older macOS versions as well (Monterey, BigSur, Catalina).

## Install all related prerequistics
Some things are here for the sake of completion. Skip any step if you already have it, eg. I expect most people using macOS already have homebrew.

### Install homebrew
Link: https://brew.sh
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Install verilator
Homebrew Link: https://formulae.brew.sh/formula/verilator
```
brew install verilator
```
Please check homebrew link for any dependencies you may need. 


### Install the GTKwave
Homebrew Link: https://formulae.brew.sh/cask/gtkwave
```
brew install --cask gtkwave
```
Please check homebrew link for any dependencies you may need. 


## Ready to run?
Step 1: Go to ledmodule folder, compile the verilog module of **ledmodule**. 
```
verilator --cc adder_var_seq.v --top-module adder_var_seq
```

Step 2: Create the Cpp simulation file for Verilator. Pls take a look at the **ledmodule.cpp** in the parent folder. The detail explainations are listed inside the script.
1. 


Step 3: Compile the executable file
```
verilator -Wall --trace --exe --build -cc adder_var_seq.cpp adder_var_seq.v
```

Step 4: Open the GTKWaver to open the generated trace
open "GTKWaver" -> "Open New Tab" -> "Select the generated waveform.vcd" -> "click on Top" -> "Right click the signals below" -> "Recurse Import" -> "Append" 
Then all waveforms will show up in the Waves window.
