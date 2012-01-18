#!/usr/bin/python2.7
#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-03
#purpose: map which addresses are left
#note: using python2.7 because of subprocess
import sys, os
from copy import copy, deepcopy
import subprocess
from extract_maps import rom, assert_rom, load_rom, calculate_pointer, load_map_pointers, read_all_map_headers, map_headers

try:
    from pretty_map_headers import map_header_pretty_printer, map_name_cleaner
except Exception:
    pass

#store each line of source code here
asm = None

#store each incbin line separately
incbin_lines = []

#storage for processed incbin lines
processed_incbins = {}

def offset_to_pointer(offset):
    if type(offset) == str: offset = int(offset, base)
    return int(offset) % 0x4000 + 0x4000

def load_asm(filename="../common.asm"):
    "loads the asm source code into memory"
    global asm
    asm = open(filename, "r").read().split("\n")
    return asm

def isolate_incbins():
    "find each incbin line"
    global incbin_lines
    incbin_lines = []
    for line in asm:
        if line == "": continue
        if line.count(" ") == len(line): continue

        #clean up whitespace at beginning of line
        while line[0] == " ":
            line = line[1:]

        if line[0:6] == "INCBIN" and "baserom.gbc" in line:
            incbin_lines.append(line)
    return incbin_lines

def process_incbins():
    "parse incbin lines into memory"
    global incbins
    incbins = {} #reset
    for incbin in incbin_lines:
        processed_incbin = {}

        line_number = asm.index(incbin)
        
        partial_start = incbin[21:]
        start = partial_start.split(",")[0].replace("$", "0x")
        start = eval(start)
        start_hex = hex(start).replace("0x", "$")

        partial_interval = incbin[21:].split(",")[1]
        partial_interval = partial_interval.replace(";", "#")
        partial_interval = partial_interval.replace("$", "0x").replace("0xx", "0x")
        interval = eval(partial_interval)
        interval_hex = hex(interval).replace("0x", "$").replace("x", "")

        end = start + interval
        end_hex = hex(end).replace("0x", "$")

        processed_incbin = {
                            "line_number": line_number,
                            "line": incbin,
                            "start": start,
                            "interval": interval,
                            "end": end,
                           }
        
        #don't add this incbin if the interval is 0
        if interval != 0:
            processed_incbins[line_number] = processed_incbin

def find_incbin_to_replace_for(address):
    """returns a line number for which incbin to edit
    if you were to insert bytes into common.asm"""
    if type(address) == str: address = int(address, 16)

    for incbin_key in processed_incbins.keys():
        incbin = processed_incbins[incbin_key]

        start = incbin["start"]
        end = incbin["end"]
        
        #print "start is: " + str(start)
        #print "end is: " + str(end)
        #print "address is: " + str(type(address))
        #print "checking.... " + hex(start) + " <= " + hex(address) + " <= " + hex(end)
        
        if start <= address <= end:
            return incbin_key
    return None

def split_incbin_line_into_three(line, start_address, byte_count):
    """
    splits an incbin line into three pieces.
    you can replace the middle one with the new content of length bytecount
    
    start_address: where you want to start inserting bytes
    byte_count: how many bytes you will be inserting
    """
    if type(start_address) == str: start_address = int(start_address, 16)

    original_incbin = processed_incbins[line]
    start = original_incbin["start"]
    end = original_incbin["end"]

    #start, end1, end2 (to be printed as start, end1 - end2)
    if start_address - start > 0:
        first = (start, start_address, start)
    else:
        first = (None) #skip this one because we're not including anything

    #this is the one you will replace with whatever content
    second = (start_address, byte_count)

    third = (start_address + byte_count, end - (start_address + byte_count))

    output = ""

    if first:
        output += "INCBIN \"baserom.gbc\",$" + hex(first[0])[2:] + ",$" + hex(first[1])[2:] + " - $" + hex(first[2])[2:] + "\n"
    output += "INCBIN \"baserom.gbc\",$" + hex(second[0])[2:] + "," + str(byte_count) + "\n"
    output += "INCBIN \"baserom.gbc\",$" + hex(third[0])[2:] + ",$" + hex(third[1])[2:] #no newline
    return output

def generate_diff_insert(line_number, newline):
    original = "\n".join(line for line in asm)
    newfile = deepcopy(asm)
    newfile[line_number] = newline #possibly inserting multiple lines
    newfile = "\n".join(line for line in newfile)

    original_filename = "ejroqjfoad.temp"
    newfile_filename = "fjiqefo.temp"

    original_fh = open(original_filename, "w")
    original_fh.write(original)
    original_fh.close()

    newfile_fh = open(newfile_filename, "w")
    newfile_fh.write(newfile)
    newfile_fh.close()

    try:
        diffcontent = subprocess.check_output("diff -u ../common.asm " + newfile_filename, shell=True)
    except AttributeError, exc:
        raise exc
    except Exception, exc:
        diffcontent = exc.output

    os.system("rm " + original_filename)
    os.system("rm " + newfile_filename)

    return diffcontent

def insert_map_header_asm(map_id):
    map = map_headers[map_id]
    line_number = find_incbin_to_replace_for(map["address"])
    if line_number == None: # or map_name_cleaner(map["name"], 0) in "\n".join(line for line in asm):
        print "i think map id=" + str(map_id) + " has previously been added."
        return #this map has already been added i bet
    newlines = split_incbin_line_into_three(line_number, map["address"], 12 + (11 * len(map["connections"])))

    map_header_asm = map_header_pretty_printer(map_headers[map_id])

    newlines = newlines.split("\n")
    if len(newlines) == 2: index = 0
    elif len(newlines) == 3:
        index = 1
        newlines[0] += "\n" #spacing is a nice thing to have
    newlines[index] = map_header_asm
    newlines = "\n".join(line for line in newlines)

    diff = generate_diff_insert(line_number, newlines)
    
    print diff
    print "... Applying diff."

    #write the diff to a file
    fh = open("temp.patch", "w")
    fh.write(diff)
    fh.close()

    #apply the patch
    os.system("patch ../common.asm temp.patch")
    
    #remove the patch
    os.system("rm temp.patch")

def wrapper_insert_map_header_asm(map_id):
    "reload the asm because it has changed (probably)"
    load_asm()
    isolate_incbins()
    process_incbins()
    insert_map_header_asm(map_id)

def dump_all_remaining_maps():
    for map_id in map_headers:
        print "Inserting map id=" + str(map_id)
        wrapper_insert_map_header_asm(map_id)

def reset_incbins():
    "reset asm before inserting another diff"
    asm = None
    incbin_lines = []
    processed_incbins = {}
    load_asm()
    isolate_incbins()
    process_incbins()

def apply_diff(diff, try_fixing=True):
    print "... Applying diff."

    #write the diff to a file
    fh = open("temp.patch", "w")
    fh.write(diff)
    fh.close()

    #apply the patch
    os.system("cp ../common.asm ../common1.asm")
    os.system("patch ../common.asm temp.patch")

    #remove the patch
    os.system("rm temp.patch")

    #confirm it's working
    try:
        subprocess.check_call("cd ../; make clean; LC_CTYPE=C make", shell=True)
        return True
    except Exception, exc:
        if try_fixing:
            os.system("mv ../common1.asm ../common.asm")
        return False

if __name__ == "__main__":
    #load map headers
    load_rom()
    load_map_pointers()
    read_all_map_headers()
    
    #load incbins (mandatory)
    load_asm()
    isolate_incbins()
    process_incbins() #print processed_incbins
    
    #line_number = find_incbin_to_replace_for(0x492c3)
    #newlines = split_incbin_line_into_three(line_number, 0x492c3, 12)
    #diff = generate_diff_insert(line_number, newlines)
    #print diff

    insert_map_header_asm(86)
    #dump_all_remaining_maps()

