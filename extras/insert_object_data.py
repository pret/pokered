#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-05
#insert object data into pokered.asm
import extract_maps
from pretty_map_headers import map_name_cleaner, object_data_pretty_printer, make_object_label_name, make_text_label, map_constants
from analyze_incbins import asm, offset_to_pointer, find_incbin_to_replace_for, split_incbin_line_into_three, generate_diff_insert, load_asm, isolate_incbins, process_incbins
import analyze_incbins
import os, sys
import subprocess
spacing = "	"

def insert_object(map_id):
    map = extract_maps.map_headers[map_id]
    object = map["object_data"]
    size = extract_maps.compute_object_data_size(object)
    address = int(map["object_data_pointer"], 16)

    line_number = find_incbin_to_replace_for(address)
    if line_number == None:
        print "skipping object data for map " + str(map["id"]) + " at " + map["object_data_pointer"] + " for " + str(size) + " bytes."
        return

    newlines = split_incbin_line_into_three(line_number, address, size)
    object_asm = object_data_pretty_printer(map_id)

    newlines = newlines.split("\n")
    if len(newlines) == 2: index = 0 #replace the 1st line with new content
    elif len(newlines) == 3: index = 1 #replace the 2nd line with new content
    
    newlines[index] = object_asm
    
    if len(newlines) == 3 and newlines[2][-2:] == "$0":
        #get rid of the last incbin line if it is only including 0 bytes
        del newlines[2]
        #note that this has to be done after adding in the new asm
    newlines = "\n".join(line for line in newlines)

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

def insert_all_objects():
    for map_id in extract_maps.map_headers.keys():
        if map_id not in extract_maps.bad_maps:
            insert_object(map_id)

            analyze_incbins.asm = None
            analyze_incbins.incbin_lines = []
            analyze_incbins.processed_incbins = {}
            load_asm()
            isolate_incbins()
            process_incbins()

if __name__ == "__main__":
    #load map headers and object data
    extract_maps.load_rom()
    extract_maps.load_map_pointers()
    extract_maps.read_all_map_headers()

    #load incbins
    load_asm()
    isolate_incbins()
    process_incbins()

    #insert_object(1)
    insert_all_objects()

