# HW1Part2
## system requirment
OS: Window -> install Ubuntu 20.04 Windows Subsystem for Linux (WSL).

## Install all related prerequistics
Pls leave at least 20 GB for the WSL in your Disk C, (20GB is a safe value). 
### Install WSL in Windows
1. Open "Microsoft Store" -> Search "ubuntu 20.04.5 LTS" -> "install"
2. Download the update patch for WSL for Windows 11 [link](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi).
3. Install the downloaded "wsl_update_x64.msi" to patch the WSL system
4. Launch Window Powershell and Update WSL
```
$ wsl --update
```
5. launch "ubuntu 20.04.5 LTS".
6. "Enter new UNIX username:" Choose whatever name for the WSL u like XD.
7. "New password:" whatever u like
8. install GUI
Follow the microsoft suggestion installation flow
```
sudo apt update
sudo apt install gedit -y
sudo apt install gimp -y
sudo apt install nautilus -y
sudo apt install vlc -y
sudo apt install x11-apps -y
```
9. Relaunch WSL through powershell
```
$ Open Windows Powershell
$ wsl
```

### Install the verilator
Note that "all prerequistics need to be installed" 

Go to [link](https://verilator.org/guide/latest/install.html#git-quick-install)
Follow the steps to install the prerequistics

```
#sudo apt-get install git perl python3 make autoconf g++ flex bison ccache
#sudo apt-get install libgoogle-perftools-dev numactl perl-doc
#sudo apt-get install libfl2  # Ubuntu only (ignore if gives error)
#sudo apt-get install libfl-dev  # Ubuntu only (ignore if gives error)
#sudo apt-get install zlibc zlib1g zlib1g-dev  # Ubuntu only (ignore if gives error)

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
Follow installation guide from Microsoft
```
sudo apt install gtkwave
```

## Ready to run?
Step 0: go back to parent directory and then download the testing file from repo 
```
cd ~
git clone https://github.com/gt-cs3220/gt-cs3220.github.io
```

Step 1: Change to the path of tested hw1part2 and compile the verilog module of **adder_var_seq**. 
```
cd gt-cs3220.github.io/Spring_2023/hw1part2/
verilator --cc adder_var_seq.v --top-module adder_var_seq
```

Step 2: Create the Cpp simulation file for Verilator. Pls take a look at the **adder_var_seq.cpp** in the current folder. The detail explainations are listed inside the  **adder_var_seq.cpp**.

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
