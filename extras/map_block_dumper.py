#!/usr/bin/python
#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-03
#purpose: extract .blk files from baserom.gbc
import extract_maps #rom, assert_rom, load_rom, calculate_pointer, load_map_pointers, read_all_map_headers, map_headers
from pretty_map_headers import map_name_cleaner
from analyze_incbins import offset_to_pointer
import sys

def extract_map_block_data(map_id, savefile=True):
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

    if savefile:
        print "Saving ../maps/" + filename + ".blk for map id=" + str(map_id)
        fh = open("../maps/" + filename + ".blk", "w")
        fh.write(blocksdata)
        fh.close()

def get_all_map_blockdata():
    for map in extract_maps.map_headers.keys():
        extract_map_block_data(map)

if __name__ == "__main__":
    #load map headers
    extract_maps.load_rom()
    extract_maps.load_map_pointers()
    extract_maps.read_all_map_headers()

    #extract_map_block_data(0)
    get_all_map_blockdata()

