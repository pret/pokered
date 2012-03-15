#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-03
#purpose: extract .blk files from baserom.gbc
#note: use python2.7 because of subprocess in analyze_incbins
import extract_maps #rom, assert_rom, load_rom, calculate_pointer, load_map_pointers, read_all_map_headers, map_headers
from pretty_map_headers import map_name_cleaner
from analyze_incbins import asm, offset_to_pointer, find_incbin_to_replace_for, split_incbin_line_into_three, generate_diff_insert, load_asm, isolate_incbins, process_incbins
import analyze_incbins
import os, sys
import subprocess
spacing = "	"

used_map_pointers = []

def extract_map_block_data(map_id, savefile=False):
    map = extract_maps.map_headers[map_id]
    if map["name"] == "FREEZE": return #skip this one

    blocksdata_pointer = int(map["map_pointer"], 16)

    y = int(map["y"], 16)
    x = int(map["x"], 16)
    size = x*y
    
    #fetch the data from the rom
    blocksdata = extract_maps.rom[blocksdata_pointer:blocksdata_pointer+size]

    #clean up the filename and label (for pokered.asm)
    cleaned_name = map_name_cleaner(map["name"], None)
    label_text = cleaned_name.replace("_h", "Blocks")
    filename = cleaned_name.replace("_h", "").lower()
    full_filepath = "maps/" + filename + ".blk"

    if savefile:
        print "Saving ../maps/" + filename + ".blk for map id=" + str(map_id)
        fh = open("../maps/" + filename + ".blk", "w")
        fh.write(blocksdata)
        fh.close()

def make_labels(name):
    cleaned_name = map_name_cleaner(name, None)
    label_text = cleaned_name.replace("_h", "Blocks")
    filename = cleaned_name.replace("_h", "").lower()
    full_filepath = "maps/" + filename + ".blk"
    return cleaned_name, label_text, filename, full_filepath

def generate_label_asm(name,size=None):
    cleaned_name, label_text, filename, full_filepath = make_labels(name)

    output = label_text + ":"
    if size: output += " ; " + str(size) + "\n"
    else: output += "\n"
    output += spacing + "INCBIN \"" + full_filepath + "\""

    return output

def insert_map_block_label(map_id):
    map = extract_maps.map_headers[map_id]
    address = int(map["map_pointer"], 16)
    y = int(map["y"], 16)
    x = int(map["x"], 16)
    size = x*y

    print "map name: " + map["name"]
    print "map address: " + map["map_pointer"]

    line_number = find_incbin_to_replace_for(address)
    if line_number == None:
        print "skipping map id=" + str(map_id) + " probably because it was already done."
        used_map_pointers.append(map["map_pointer"])
        return

    newlines = split_incbin_line_into_three(line_number, address, size)

    label_asm = generate_label_asm(map["name"], size)

    newlines = newlines.split("\n")
    if len(newlines) == 2: index = 0 #replace the 1st line with new content
    elif len(newlines) == 3: index = 1 #replace the 2nd line with new content
    
    newlines[index] = label_asm
    
    if len(newlines) == 3 and newlines[2][-2:] == "$0":
        #get rid of the last incbin line if it is only including 0 bytes
        del newlines[2]
        #note that this has to be done after adding in the new asm
    newlines = "\n".join(line for line in newlines)

    #fix a lame error from somewhere
    newlines = newlines.replace("$x", "$")

    diff = generate_diff_insert(line_number, newlines)
    print diff
    print "... Applying diff."

    #write the diff to a file
    fh = open("temp.patch", "w")
    fh.write(diff)
    fh.close()

    #apply the patch
    os.system("patch ../pokered.asm temp.patch")
    
    #remove the patch
    os.system("rm temp.patch")

    #confirm it's working
    subprocess.check_call("cd ../; make clean; LC_CTYPE=UTF-8 make", shell=True)

def get_all_map_blockdata():
    for map in extract_maps.map_headers.keys():
        extract_map_block_data(map)

def insert_all_labels():
    "this is very buggy, don't use it"
    #limit = 200 #0:150
    for map in extract_maps.map_headers.keys():
        mapmap = extract_maps.map_headers[map]
        if mapmap["name"] == "FREEZE": continue #skip this one
        if "Ash's" in mapmap["name"]: continue
        if "Gary's" in mapmap["name"]: continue
        if not ("cat" in mapmap["name"]) and "copy" in mapmap["name"].lower(): continue #skip this one

        #bill's house breaks things?
        #if mapmap["name"] == "Bill's House": continue
        if mapmap["name"] == "Viridian Forest": continue
        #if mapmap["name"] == "Cerulean Mart": continue
        if mapmap["name"] == "Virdian Forest Exit": continue
        #if "copy" in mapmap["name"].lower(): continue #skip this one too..

        if mapmap["map_pointer"] in used_map_pointers: continue #skip for sure
    
        #reset asm
        analyze_incbins.asm = None
        analyze_incbins.incbin_lines = []
        analyze_incbins.processed_incbins = {}

        #reload asm each time
        load_asm()

        #check if this label is already in there
        cleaned_name, label_text, filename, full_filepath = make_labels(mapmap["name"])
        if label_text in "\n".join(line for line in analyze_incbins.asm):
            print "skipping (found label text in asm already)"
            used_map_pointers.append(mapmap["map_pointer"])
            continue #skip this one

        isolate_incbins()
        process_incbins()
        
        print "XYZ|" + mapmap["name"]
        insert_map_block_label(map)

        used_map_pointers.append(mapmap["map_pointer"])

if __name__ == "__main__":
    #load map headers
    extract_maps.load_rom()
    extract_maps.load_map_pointers()
    extract_maps.read_all_map_headers()

    #load incbins
    load_asm()
    isolate_incbins()
    process_incbins()

    #extract_map_block_data(2)
    #get_all_map_blockdata()

    #insert_map_block_label(49)
    insert_all_labels()
