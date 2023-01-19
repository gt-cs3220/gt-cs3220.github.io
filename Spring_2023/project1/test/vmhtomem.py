import os
import sys

begin = False
OPEXT = '000000'
OPSYS = '111111'
PAD = '00000000'
dbgflgs = ['-v','-d']
hexout = []  #['00000000']*64
hexname = sys.argv[1]
flag = None if len(sys.argv) < 3 else sys.argv[2]
DEBUG = flag and flag in dbgflgs
memname = hexname.replace('hex','mem')
decname = hexname.replace('mem','dec')
print (decname) 
currentmem = 0 
if not os.path.isfile(hexname):
   print("File path {} does not exist. Exiting...".format(hexname))
   sys.exit()

with open(hexname, 'r') as hexf:
	line = hexf.readline().strip()
	while line:
		if line[0] != '@':
			for data in line.split():
				hexout.append(data)
				currentmem = currentmem+1 
				# print (data)
				
		elif line[0] == '@':
			print (line)
			memstart = int(line[1:9],16)/4
			print (memstart)
			print (currentmem)
			padn = (memstart - currentmem)
			hexout.extend([PAD]*padn)
			currentmem = memstart 
		line = hexf.readline().strip()


if os.path.isfile(memname):
	os.system('rm {}'.format(memname))

with open(memname, 'w+') as f:
	for h in hexout:
		f.write('{}\n'.format(h))
f.close()
start_addr = 0x0 

with open(decname, 'w+') as f2:
	for h in hexout:
		res = int(h, 16)
		add=hex(start_addr)
		f2.write('{}'.format(add))
		f2.write('\t{}\n'.format(res))
		start_addr = start_addr+4 
	f2.close()
