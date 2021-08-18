CC=g++
CFLOGAS=-I.

%.o: %.c $(DEPS)
	$(CC) -c -o $@  $< $(CFLAGS)

emmu: mul_test.o mulBF16.o 
	$(CC) -o emu mul_test.o mulBF16.o 

.PHONY: clean

clean:
	rm -rf mul.o mul_test.o mulBF16.o emu

