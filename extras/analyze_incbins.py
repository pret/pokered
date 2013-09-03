#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-03
#purpose: map which addresses are left
#note: use python2.7 because of subprocess
import sys, os
from copy import copy, deepcopy
import subprocess
import json
from extract_maps import rom, assert_rom, load_rom, calculate_pointer, load_map_pointers, read_all_map_headers, map_headers
from pokered_dir import pokered_dir

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

def load_asm(filename=os.path.join(pokered_dir, "main.asm")):
    """loads the asm source code into memory
    this also detects if the revision of the repository
    is using main.asm, common.asm or pokered.asm, which is
    useful when generating images in romvisualizer.py"""
    global asm
    # chronological order is important
    defaults = [os.path.join(pokered_dir, f) for f in ["main.asm", "common.asm", "pokered.asm"]]
    if filename in defaults:
        if not load_asm_if_one_exists_in(defaults):
            raise Exception("This shouldn't happen")
    elif os.path.exists(filename):
        asm = get_all_lines_from_file(filename)
    if asm is None:
        raise Exception("file doesn't exists (did you mean one among: {0}?)".format(", ".join(defaults)))
    return asm

def load_asm_if_one_exists_in(defaults):
    global asm
    for f in defaults:
        if os.path.exists(f):
            asm = get_all_lines_from_file(f)
            return True
    return False

def get_all_lines_from_file(filename):
    try:
        return open(filename, "r").read().split("\n")
    except IOError as e:
        raise(e)

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
    if you were to insert bytes into main.asm"""
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
        diffcontent = subprocess.check_output(
                "diff -u {0} {1}".format(os.path.join(pokered_dir, "main.asm"), newfile_filename),
                shell=True)
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
    os.system("patch {0} temp.patch".format(os.path.join(pokered_dir, "main.asm")))
    
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

def apply_diff(diff, try_fixing=True, do_compile=True):
    print "... Applying diff."

    #write the diff to a file
    fh = open("temp.patch", "w")
    fh.write(diff)
    fh.close()

    #apply the patch
    os.system("cp {0} {1}".format(
        os.path.join(pokered_dir, "main.asm"),
        os.path.join(pokered_dir, "main1.asm")))
    os.system("patch {0} {1}".format(
        os.path.join(pokered_dir, "main.asm"),
        "temp.patch"))

    #remove the patch
    os.system("rm temp.patch")

    #confirm it's working
    if do_compile:
        try:
            subprocess.check_call("cd {0}; make clean; LC_CTYPE=C make".format(pokered_dir), shell=True)
            return True
        except Exception, exc:
            if try_fixing:
                os.system("mv {0} {1}".format(
                    os.path.join(pokered_dir, "main1.asm"),
                    os.path.join(pokered_dir, "main.asm")))
            return False

def index(seq, f):
    """return the index of the first item in seq
    where f(item) == True."""
    return next((i for i in xrange(len(seq)) if f(seq[i])), None)

def is_probably_pointer(input):
    try:
        blah = int(input, 16)
        return True
    except:
        return False

label_errors = ""
def get_labels_between(start_line_id, end_line_id, bank_id):
    labels = []
    #label = {
    #   "line_number": 15,
    #   "bank_id": 32,
    #   "label": "PalletTownText1",
    #   "local_pointer": "$5315",
    #   "address": 0x75315,
    #}
    global label_errors
    errors = ""
    current_line_offset = 0

    sublines = asm[start_line_id : end_line_id + 1]
    for line in sublines:
        label = {}
        line_id = start_line_id + current_line_offset
        address = None
        local_pointer = None

        if ": ; 0x" in line:
            temp = line.split(": ; 0x")[1]

            # just read until the comma appears
            if "," in line:
                temp = temp.split(",")[0]

            if not " " in temp:
                address = int("0x" + temp, 16)
            else:
                temp2 = temp.split(" ")[0]
                address = int("0x" + temp2, 16)
        elif ": ; " in line:
            partial = line.split(": ; ")[1]
            if ": ; $" in line:
                temp = line.split(": ; $")[1]
                if " " in temp:
                    temp = temp.split(" ")[0]
                local_pointer = "$" + temp
            elif " " in partial:
                if " to " in partial:
                    temp = partial.split(" to ")[0]
                    if "0x" in temp:
                        address = int(temp, 16)
                    elif len(temp) == 4:
                        local_pointer = "$" + temp
                    else:
                        errors += "found \" to \" in partial on line " + str(line_id) + ", but don't know what to do (debug14)" + "\n"
                        errors += "line is: " + line + "\n"
                        continue
                elif partial[4] == " " and partial[5] == "(":
                    temp = partial[0:4]
                    address = int(temp, 16)
                elif partial[5] == " " and partial[6] == "(":
                    temp = partial[0:5]
                    address = int(temp, 16)
                elif len(partial[4]) == 4 or partial[4] == " ": #then it's probably a local pointer
                    temp = partial[0:4]
                    local_pointer = "$" + temp
                else:
                    errors += "found \": ; \" and another \" \" in line " + str(line_id) + ", but don't know what to do (debug15)" + "\n"
                    errors += "line is: " + line + "\n"
                    continue
            else:
                if len(partial) > 3 and partial[2] == ":": #14:3BAC
                    temp = partial[2].split(":")[1]
                    if len(temp) == 3 or len(temp) == 4:
                        local_pointer = "$" + temp
                    else:
                        temp = temp.split(" ")[0]
                        local_pointer = "$" + temp
                elif len(partial) == 4 or (len(partial) == 3 and is_probably_pointer(partial)):
                    local_pointer = "$" + partial
                else:
                    errors += "found \": ; \" in line " + str(line_id) + ", but don't know what to do (debug16)" + "\n"
                    errors += "line is: " + line + "\n"
                    continue
        else:
            #this line doesn't have a label
            continue

        if local_pointer != None and not is_probably_pointer(local_pointer.replace("0x", "").replace("$", "")):
            continue

        line_label = line.split(": ;")[0]

        if address == None and local_pointer != None:
            temp = int(local_pointer.replace("$", "0x"), 16)
            if temp < 0x4000 or bank_id == 0:
                address = temp
            else:
                address = calculate_pointer(int(local_pointer.replace("$", "0x"), 16), bank_id)
        elif local_pointer == None and address != None:
            if address < 0x4000:
                local_pointer = hex(address).replace("0x", "$")
            else:
                local_pointer = hex((address % 0x4000) + 0x4000).replace("0x", "$")

        print line_label + " is at " + hex(address)
        
        label = {
            "line_number": line_id,
            "bank_id": bank_id,
            "label": line_label,
            "local_pointer": local_pointer,
            "address": address
        }
        labels.append(label)

        current_line_offset += 1 
    label_errors += errors
    return labels

def scan_for_predefined_labels():
    """looks through the asm file for labels at specific addresses,
    this relies on the label having its address after. ex:

    ViridianCity_h: ; 0x18357 to 0x18384 (45 bytes) (bank=6) (id=1)
    PalletTownText1: ; 4F96 0x18f96
    ViridianCityText1: ; 0x19102

    It would be more productive to use rgbasm to spit out all label
    addresses, but faster to write this script. rgbasm would be able
    to grab all label addresses better than this script..
    """
    bank_intervals = {}
    all_labels = []

    if asm is None:
        load_asm()

    #figure out line numbers for each bank
    for bank_id in range(0x2d):
        abbreviation = ("%.x" % (bank_id)).upper()
        abbreviation_next = ("%.x" % (bank_id+1)).upper()
        if bank_id == 0:
            abbreviation = "0"
            abbreviation_next = "1"

        start_line_id = index(asm, lambda line: "\"bank" + abbreviation + "\"" in line)

        if bank_id != 0x2c:
            end_line_id = index(asm, lambda line: "\"bank" + abbreviation_next + "\"" in line)
        else:
            end_line_id = len(asm) - 1

        print "bank" + abbreviation + " starts at " + str(start_line_id) + " to " + str(end_line_id)

        bank_intervals[bank_id] = {
                                    "start": start_line_id,
                                    "end": end_line_id,
                                  }
     
    for bank_id in bank_intervals.keys():
        bank_data = bank_intervals[bank_id]

        start_line_id = bank_data["start"]
        end_line_id   = bank_data["end"]

        labels = get_labels_between(start_line_id, end_line_id, bank_id)
        #bank_intervals[bank_id]["labels"] = labels
        all_labels.extend(labels)

    write_all_labels(all_labels)
    return all_labels

def write_all_labels(all_labels):
    fh = open("labels.json", "w")
    fh.write(json.dumps(all_labels))
    fh.close()

def analyze_intervals():
    """find the largest baserom.gbc intervals"""
    global asm
    global processed_incbins
    if asm == None:
        load_asm()
    if processed_incbins == {}:
        isolate_incbins()
        process_incbins()
    
    results = []
    ordered_keys = sorted(processed_incbins, key=lambda entry: processed_incbins[entry]["interval"])
    ordered_keys.reverse()
    for key in ordered_keys:
        results.append(processed_incbins[key])

    return results

if __name__ == "__main__":
    #load map headers
    load_rom()
    load_map_pointers()
    read_all_map_headers()
    
    #load incbins (mandatory)
    load_asm()
    #isolate_incbins()
    #process_incbins()
    #print processed_incbins
    
    #line_number = find_incbin_to_replace_for(0x492c3)
    #newlines = split_incbin_line_into_three(line_number, 0x492c3, 12)
    #diff = generate_diff_insert(line_number, newlines)
    #print diff

    #insert_map_header_asm(86)
    #dump_all_remaining_maps()

    scan_for_predefined_labels()
    print "Errors:"
    print label_errors

