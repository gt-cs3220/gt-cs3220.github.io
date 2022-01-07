#!/usr/bin/env python3
from argparse import ArgumentParser
from argparse import FileType
from collections import namedtuple
import re

# NOTE: instructions/labels/directives must be on separate lines; comments can be anywhere
# NOTE: symbols must be defined BEFORE being referenced by .ORG or .WORD directives

def main():
    parser = ArgumentParser(description='Compiles assembly file into .mif format')
    parser.add_argument('input', help='assembly file input', type=FileType('r'))
    args = parser.parse_args()
    mif = assemble(args.input)
    f = args.input.name[0:args.input.name.index('.')] + '.mif'
    with open(f, 'w') as out:
        out.write(mif)

def assemble(source, depth=16384, width=32, address_radix='HEX', data_radix='HEX'):
    memwords = []
    symbols = {}
    current_byte = 0;
    # first pass - parse lines into MemWords, create symbol table
    for line in source.readlines():
        if ';' in line:
            line = line[0:line.index(';')] # remove comment
        line = line.strip()
        if ':' in line:
            label = line[0:line.index(':')].strip()
            if label in symbols:
                print("WARNING: symbol redefinition: " + label)
            symbols[label] = hex(current_byte)
        elif '.NAME' in line:
            name = line[line.index('.NAME')+5:line.index('=')].strip()
            if name in symbols:
                print("ERROR: symbol redefinition: " + name)
            value = int(line[line.index('=')+1:].strip(),0)
            symbols[name] = hex(value)
        elif '.ORG' in line:
            value = line[line.index('.ORG')+5:].strip()
            if value in symbols:
                value = symbols[value] # resolve symbol reference
            value = int(value,0)
            current_byte = value
        elif '.WORD' in line:
            value = line[line.index('.WORD')+5:].strip()
            if value in symbols:
                value = symbols[value] # resolve symbol reference
            value = hex(int(value,0))[2:].zfill(8)
            memwords.append(MemWord(value, None, current_byte, line))
            current_byte += 4
        elif line: # instruction
            tokens = re.findall(r"[\w-]+", line)
            memwords.append(MemWord(None, tokens, current_byte, line))
            current_byte += 4

    # mif header
    mif  = 'DEPTH = {0};\n'.format(depth)
    mif += 'WIDTH = {0};\n'.format(width)
    mif += 'ADDRESS_RADIX = {0};\n'.format(address_radix)
    mif += 'DATA_RADIX = {0};\n'.format(data_radix)
    mif += 'CONTENT\n'
    mif += 'BEGIN\n'

    mem_line = '    {0:04x} : {1}; --> {2:04x} : {3}\n'
    mem_range = '    [{0:04x}..{1:04x}] : {2};\n'
    current_byte = 0
    # second pass - assemble MemWords into machine code (mif format)
    for mw in memwords:
        hex8 = mw.hex8
        if not hex8:
            t = mw.tokens
            t[0] = t[0].lower()
            # resolve pseudo-instruction tokens into standard instruction tokens
            if t[0] == 'subi':
                t = ['addi', t[1], t[2], str(-int(t[3], 0))]
            elif t[0] == 'not':
                t = ['nand', t[1], t[2], t[2]]
            elif t[0] == 'call':
                t = ['jal', 'ra', t[1], t[2]]
            elif t[0] == 'ret':
                t = ['jal', 'r10', '0', 'ra']
            elif t[0] == 'jmp':
                t = ['jal', 'r10', t[1], t[2]]
            elif t[0] == 'br':
                t = ['beq', 'zero', 'zero', t[1]]
            elif t[0] == 'bgt':
                t = ['blt', t[2], t[1], t[3]]
            elif t[0] == 'bge':
                t = ['ble', t[2], t[1], t[3]]
            elif t[0] == 'gt':
                t = ['lt', t[1], t[3], t[2]]
            elif t[0] == 'ge':
                t = ['le', t[1], t[3], t[2]]
            # assemble into machine code
            opcode = opcodes[t[0]]
            if t[0] in EXT_TYPE:
                rd = regs[t[1].lower()]
                rs = regs[t[2].lower()]
                rt = regs[t[3].lower()]
                bin32 = opcode + '000000' + rd + rs + rt # bin32
            if t[0] in IMM_TYPE:
                if t[0] in IMM_TYPE_ALU + IMM_TYPE_BR:
                    imm = t[3]
                    rs = regs[t[1].lower()]
                    rt = regs[t[2].lower()]
                if t[0] in IMM_TYPE_JAL + IMM_TYPE_MEM:
                    imm = t[2]
                    rs = regs[t[3].lower()]
                    rt = regs[t[1].lower()]
                if imm in symbols:
                    imm = symbols[imm] # resolve symbol reference
                imm = int(imm,0)
                if t[0] in IMM_TYPE_BR:
                    imm = imm - mw.address - 4 # convert to PC offset
                if t[0] in IMM_TYPE_BR + IMM_TYPE_JAL:
                    imm = imm>>2 # encode at word-resolution
                imm = bin(imm & 0xffff)[2:].zfill(16) # bin16
                bin32 = opcode + '00' + imm + rs + rt # bin32
            hex8 = hex(int(bin32,2))[2:].zfill(8) # hex8

        if current_byte < mw.address:
            mif += mem_range.format(current_byte>>2, mw.address - 1, 'dead')
            current_byte = mw.address
        mif += mem_line.format(current_byte>>2, hex8, mw.address, mw.asm)
        current_byte += 4

    #mif footer
    if current_byte < depth:
        mif += mem_range.format(current_byte>>2, depth - 1, 'dead')
    mif += 'END;\n'
    return mif

MemWord = namedtuple('MemWord', 'hex8 tokens address asm')

regs = {
    'r0'    :   '0000',
    'r1'    :   '0001',
    'r2'    :   '0010',
    'r3'    :   '0011',
    'r4'    :   '0100',
    'r5'    :   '0101',
    'r6'    :   '0110',
    'r7'    :   '0111',
    'r8'    :   '1000',
    'r9'    :   '1001',
    'r10'   :   '1010',
    'r11'   :   '1011',
    'r12'   :   '1100',
    'r13'   :   '1101',
    'r14'   :   '1110',
    'r15'   :   '1111',
    'zero'  :   '0000', # r0
    'a0'    :   '0001', # r1
    'a1'    :   '0010', # r2
    'a2'    :   '0011', # r3
    'a3'    :   '0100', # r4
    'rv'    :   '0100', # r4
    't0'    :   '0101', # r5
    't1'    :   '0110', # r6
    's0'    :   '0111', # r7
    's1'    :   '1000', # r8
    's2'    :   '1001', # r9
    'fp'    :   '1101', # r13
    'sp'    :   '1110', # r14
    'ra'    :   '1111'  # r15
}

EXT = '000000'
opcodes = {
    'eq'    :   EXT + '00001000',
    'lt'    :   EXT + '00001001',
    'le'    :   EXT + '00001010',
    'ne'    :   EXT + '00001011',
    'add'   :   EXT + '00100000',
    'and'   :   EXT + '00100100',
    'or'    :   EXT + '00100101',
    'xor'   :   EXT + '00100110',
    'sub'   :   EXT + '00101000',
    'nand'  :   EXT + '00101100',
    'nor'   :   EXT + '00101101',
    'nxor'  :   EXT + '00101110',
    'rshf'  :   EXT + '00110000',
    'lshf'  :   EXT + '00110001',
    'addi'  :   '100000',
    'andi'  :   '100100',
    'ori'   :   '100101',
    'xori'  :   '100110',
    'beq'   :   '001000',
    'blt'   :   '001001',
    'ble'   :   '001010',
    'bne'   :   '001011',
    'jal'   :   '001100',
    'lw'    :   '010010',
    'sw'    :   '011010',
}

EXT_TYPE        = ('eq','lt','le','ne','add','and','or','xor','sub','nand','nor','nxor','rshf','lshf')
IMM_TYPE        = ('addi','andi','ori','xori','beq','blt','ble','bne','jal','lw','sw')
IMM_TYPE_ALU    = ('addi','andi','ori','xori')
IMM_TYPE_BR     = ('beq','blt','ble','bne')
IMM_TYPE_JAL    = ('jal',)
IMM_TYPE_MEM    = ('lw','sw')

main() # run main script
