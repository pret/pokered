#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-24
from optparse import OptionParser
from gbz80disasm import load_labels, find_label
from extract_maps import calculate_pointer
import sys
spacing = "\t"
rom = None

def pretty_print_trainer_header(address, label=None):
    """make pretty text for a trainer header"""
    global rom
    output = ""
    bank_id = 0
    if address > 0x4000:
        bank_id = address / 0x4000
    
    #convert address to an integer if necessary
    if type(address) == str:
        if "$" in address: address = address.replace("$", "0x")
        address = int(address, 16)

    #label this section of asm
    if label == None:
        output += "TrainerHeader_" + hex(address)[2:] + ": ; 0x" + hex(address)[2:] + "\n"
    else:
        output += label + ": ; 0x" + hex(address)[2:] + "\n"
    
    #flag's bit
    output += spacing + "db $" + hex(ord(rom[address]))[2:] + " ; flag's bit\n"
    
    #trainer's view range
    view_range = ord(rom[address+1]) >> 4
    output += spacing + "db ($" + hex(view_range)[2:] + " << 4) ; trainer's view range\n"

    #flag's byte
    pointer_byte1 = ord(rom[address+2])
    pointer_byte2 = ord(rom[address+3])
    partial_pointer = (pointer_byte1 + (pointer_byte2 << 8))
    partial_pointer = "$%.2x" % partial_pointer
    output += spacing + "dw " + partial_pointer + " ; flag's byte\n"

    #TextBeforeBattle
    pointer_byte1 = ord(rom[address+4])
    pointer_byte2 = ord(rom[address+5])
    partial_pointer = (pointer_byte1 + (pointer_byte2 << 8))
    label = find_label(partial_pointer, bank_id)
    if label == None:
        print "label not found for (TextBeforeBattle) " + hex(calculate_pointer(partial_pointer, bank_id))
        print ""
        label = "$" + hex(partial_pointer)[2:]
        #sys.exit(0)

    output += spacing + "dw " + label + " ; " + hex(partial_pointer) + " TextBeforeBattle\n"

    #TextAfterBattle
    pointer_byte1 = ord(rom[address+6])
    pointer_byte2 = ord(rom[address+7])
    partial_pointer = (pointer_byte1 + (pointer_byte2 << 8))
    label = find_label(partial_pointer, bank_id)
    if label == None:
        print "label not found for (TextAfterBattle) " + hex(calculate_pointer(partial_pointer, bank_id))
        print ""
        label = "$" + hex(partial_pointer)[2:]
        #sys.exit(0)

    output += spacing + "dw " + label + " ; " + hex(partial_pointer) + " TextAfterBattle\n"

    #TextEndBattle
    pointer_byte1 = ord(rom[address+8])
    pointer_byte2 = ord(rom[address+9])
    partial_pointer = (pointer_byte1 + (pointer_byte2 << 8))
    label = find_label(partial_pointer, bank_id)
    if label == None:
        print "label not found for (TextEndBattle) " + hex(calculate_pointer(partial_pointer, bank_id))
        print ""
        label = "$" + hex(partial_pointer)[2:]
        #sys.exit(0)

    output += spacing + "dw " + label + " ; " + hex(partial_pointer) + " TextEndBattle\n"

    #TextEndBattle
    pointer_byte1 = ord(rom[address+10])
    pointer_byte2 = ord(rom[address+11])
    partial_pointer = (pointer_byte1 + (pointer_byte2 << 8))
    label = find_label(partial_pointer, bank_id)
    if label == None:
        print "label not found for (TextEndBattle) " + hex(calculate_pointer(partial_pointer, bank_id))
        print ""
        label = "$" + hex(partial_pointer)[2:]
        #sys.exit(0)

    output += spacing + "dw " + label + " ; " + hex(partial_pointer) + " TextEndBattle\n"

    output += "; " + hex(address+12) + "\n"

    return output

def all_trainer_headers_at(address):
    i = 0
    while ord(rom[address + (i*12)]) != 0xff:
        print pretty_print_trainer_header(address + (i*12))
        i += 1

def main():
    load_labels()

    usage = "usage: %prog address"
    parser = OptionParser(usage)
    (options, args) = parser.parse_args()
    if len(args) == 1:
        print "usage: python pretty_trainer_headers.py address label\n"
        args.append("TrainerHeader_" + (args[0].replace("0x", "")))
    elif len(args) != 2:
        parser.error("we need both an address and a label")
    address = int(args[0], 16)
    label = args[1]

    global rom
    rom = open("../baserom.gbc", "r").read()

    #print pretty_print_trainer_header(address, label)
    print all_trainer_headers_at(address)

if __name__ == "__main__":
    main()
