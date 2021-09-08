import os
import sys

begin = False
OPEXT = '000000'
OPSYS = '111111'
PAD = '00000000'
dbgflgs = ['-v','-d']
hexout = []  #['00000000']*64
mifname = sys.argv[1]
flag = None if len(sys.argv) < 3 else sys.argv[2]
DEBUG = flag and flag in dbgflgs
hexname = mifname.replace('mif','hex')

if not os.path.isfile(mifname):
   print("File path {} does not exist. Exiting...".format(mifname))
   sys.exit()

with open(mifname, 'r') as mif:
	line = mif.readline().strip()
	while line:
		if begin and line.lower() != 'end;':
			if line[0] != '[':
				si = line.index(':')+1
				ei = line.index(';')
				insthex = line[si:ei].strip()
				hexout.append(insthex)
				if DEBUG:
					instbin = bin(int(insthex,16))[2:].zfill(32)
					print(insthex + '  |  ' + instbin)
					tokens = {}
					### Must account for endianness! Indices for tokens are reversed
					op1 = instbin[0:6]
					op2 = instbin[6:14]
					imm = instbin[8:24]
					rd = instbin[20:24]
					rs = instbin[24:28]
					rt = instbin[28:]
					tokens.update({'OP1':op1})
					if op1 == OPEXT or op1 == OPSYS:
						tokens.update({'OP2':op2})
						if op1 == OPEXT:
							tokens.update({'Rd':rd,'Rs':rs,'Rt':rt})
						elif op1 == OPSYS:
							if op2 == '00000001':	 		# RETI
								pass
							elif op2 == '00000010':  		# RSR
								rsrrd = instbin[14:18]
								rsrss = instbin[18:22]
								tokens.update({'Rd':rsrrd,'Ss':rsrss})
							elif op2 == '00000011':	 		# WSR
								wsrsd = instbin[14:18]
								wsrrs = instbin[18:22]
								tokens.update({'Sd':wsrsd,'Rs':wsrrs})
					else: 									# An Immd instruction
						tokens.update({'Immd':imm,'Rs':rs,'Rt':rt})
					print(tokens)
					print
			elif line[0] == '[':
				# FIXED: Add padding for .ORG and .WORD statements
				# Each pad is worth 4 bytes: 0x100==256 => pad (256/4) times
				memstart = int(line[1:5],16)
				memend = (int(line[7:11],16) + 1) >> 2
				padn = (memend - memstart)
				hexout.extend([PAD]*padn)
		else:
			begin = line.lower() == 'begin'
		line = mif.readline().strip()

if os.path.isfile(hexname):
	os.system('rm {}'.format(hexname))

with open(hexname, 'w+') as f:
	for h in hexout:
		f.write('{}\n'.format(h))
