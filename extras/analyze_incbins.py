#!/usr/bin/python
#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-03
#purpose: map which addresses are left
import sys, os
from copy import copy, deepcopy
import subprocess
from extract_maps import rom, assert_rom, load_rom, calculate_pointer

#store each line of source code here
asm = None

#store each incbin line separately
incbin_lines = []

#storage for processed incbin lines
processed_incbins = {}

def offset_to_pointer(offset):
    if type(offset) == str: offset = int(offset, base)
    return int(offset) % 0x4000 + 0x4000

def load_asm(filename="../pokered.asm"):
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
        partial_interval = partial_interval.replace("$", "0x")
        interval = eval(partial_interval)
        interval_hex = hex(interval).replace("0x", "$")

        end = start + interval
        end_hex = hex(end).replace("0x", "$")

        processed_incbin = {
                            "line_number": line_number,
                            "line": incbin,
                            "start": start,
                            "interval": interval,
                            "end": end,
                           }
        
        processed_incbins[line_number] = processed_incbin

def find_incbin_to_replace_for(address):
    """returns a line number for which incbin to edit
    if you were to insert bytes into pokered.asm"""
    if type(address) == str: int(address, 16)

    for incbin_key in processed_incbins.keys():
        incbin = processed_incbins[incbin_key]

        start = incbin["start"]
        end = incbin["end"]

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
        diffcontent = subprocess.check_output("diff -u " + original_filename + " " + newfile_filename, shell=True)
    except Exception, exc:
        diffcontent = exc.output

    os.system("rm " + original_filename)
    os.system("rm " + newfile_filename)

    return diffcontent

if __name__ == "__main__":
    load_asm()
    isolate_incbins()
    process_incbins() #print processed_incbins
    
    line_number = find_incbin_to_replace_for(0x492c3)
    newlines = split_incbin_line_into_three(line_number, 0x492c3, 12)
    diff = generate_diff_insert(line_number, newlines)
    print diff

