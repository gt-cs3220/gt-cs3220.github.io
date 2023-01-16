
ASSEMBLE_SRC_ROOT := .
TB_ROOT := .

IFLAG    +=  -g -DHLS_SIM
CC        = verilator
MODULE    = fifo
OUT_DIR   = obj_dir
GTK       = gtkwave
WAVE_FILE = waveform.vcd


#ALLOUT+= csim.out

all: compile build run 
##TO BE MODIFIED START

compile:
	$(CC) --cc $(MODULE).v --top-module $(MODULE)

build:
	$(CC) -Wall --trace --exe --build -cc $(MODULE).cpp $(MODULE).v

run:
	./$(OUT_DIR)/V$(MODULE)

clean:
	rm -rf obj_dir

wave:
	$(GTK) $(WAVE_FILE)