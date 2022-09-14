import os
import sys


flag = None if len(sys.argv) < 3 else sys.argv[2]
dumpname = sys.argv[1]
DEBUG = flag and flag in dbgflgs
asmname = dumpname.replace('dump','asm')
currentmem = 0 
if not os.path.isfile(dumpname):
   print("File path {} does not exist. Exiting...".format(dumpname))
   sys.exit()


f = open(asmname, 'w')
# add nop until 0x200 
for ii in range(128):
	f.write('nop\n')
dump = open(dumpname, "r")
# skip the header 
next(dump)
next(dump)
next(dump)


for line in dump:
	data = line.split()
	size_data = len(data)
	if data: 
		if ":" in data[0]: 
			comment_found = 0 
			for ii in range(2,len(data)):
				if "#" in data[ii]:
					comment_found = 1  
				if (comment_found == 0 )and (not  "<" in data[ii]):
					f.write(data[ii]),
					f.write(' '), 
			f.write("\n")
