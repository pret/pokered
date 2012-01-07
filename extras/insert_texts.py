#!/usr/bin/python2.7
#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-07
#insert TX_FAR targets into pokered.asm
import extract_maps
from analyze_texts import analyze_texts
from pretty_map_headers import map_name_cleaner, make_text_label, map_constants, find_all_tx_fars, tx_far_pretty_printer, tx_far_label_maker
import pretty_map_headers
from analyze_incbins import asm, offset_to_pointer, find_incbin_to_replace_for, split_incbin_line_into_three, generate_diff_insert, load_asm, isolate_incbins, process_incbins, reset_incbins, apply_diff
import analyze_incbins
import os, sys
import subprocess
spacing = "    "
tx_fars = None

def find_tx_far_entry(map_id, text_id):
    for tx_far_line in tx_fars:
        if tx_far_line[0] == map_id and tx_far_line[1] == text_id:
            return tx_far_line

def insert_tx_far(map_id, text_id, tx_far_line=None):
    "inserts a tx_far"
    global tx_fars
    if tx_far_line == None:
        tx_far_line = find_tx_far_entry(map_id, text_id)
    text_pointer = tx_far_line[2]
    start_address = tx_far_line[3]
    tx_far_object = tx_far_line[4]
    end_address = tx_far_object[1]["end_address"] + 1 #the end byte; +1 because of a bug somewhere :(

    line_number = find_incbin_to_replace_for(start_address)
    if line_number == None:
        print "skipping tx_far for map_id=" + str(map_id) + " text_id=" + str(text_id) + " text_pointer=" + hex(text_pointer) + " tx_far_start_address=" + hex(start_address)
        return

    #also do a name check
    label = tx_far_label_maker(extract_maps.map_headers[map_id]["name"], text_id)
    if (label + ":") in "\n".join(analyze_incbins.asm):
        print "skipping tx_far for map_id=" + str(map_id) + " text_id=" + str(text_id) + " text_pointer=" + hex(text_pointer) + " tx_far_start_address=" + hex(start_address)
        return
    
    newlines = split_incbin_line_into_three(line_number, start_address, end_address - start_address)
    tx_far_asm = tx_far_pretty_printer(tx_far_line)

    newlines = newlines.split("\n")
    if len(newlines) == 2: index = 0 #replace the 1st line with new content
    elif len(newlines) == 3: index = 1 #replace the 2nd line with new content
    
    newlines[index] = tx_far_asm

    if len(newlines) == 3 and newlines[2][-2:] == "$0":
        #get rid of the last incbin line if it is only including 0 bytes
        del newlines[2]
        #note that this has to be done after adding in the new asm
    newlines = "\n".join(line for line in newlines)
    newlines = newlines.replace("$x", "$") #where does this keep coming from??

    #signs are dumb; cluster the labels please
    if "\"needs fulfilled!\", $55" in newlines:
        newlines = "\n" + label + ": "
        line_number += 1
    if ("STRENGTH to move!" in newlines) or ("it the way it is." in newlines):
        newlines = "\n" + label + ": "
        line_number += 1
    if "@\"" in newlines and not "@@\"" in newlines:
        newlines = newlines.replace("@", "@@")

    #Char52 doesn't work yet? oh well
    newlines = newlines.replace("Char52", "$52")

    diff = generate_diff_insert(line_number, newlines)
    print "working on map_id=" + str(map_id) + " text_id=" + str(text_id)
    print diff
    apply_diff(diff)

def insert_all_tx_fars():
    for tx_far in tx_fars:
        map_id = tx_far[0]
        text_id = tx_far[1]
        #if map_id <= 185: continue #i'm just trying to get it going faster

        insert_tx_far(map_id, text_id, tx_far_line=tx_far)

        reset_incbins()
        analyze_incbins.reset_incbins()
        asm = None
        incbin_lines = []
        processed_incbins = {}
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

    #load texts (these two have different formats)
    all_texts = pretty_map_headers.analyze_texts.analyze_texts()
    pretty_map_headers.all_texts = all_texts
    tx_fars = pretty_map_headers.find_all_tx_fars()

    #load incbins
    reset_incbins()

    #insert _ViridianCityText10
    #insert_tx_far(1, 10)

    insert_all_tx_fars()

    #just me testing a pokemart sign duplicate
    #insert_tx_far(3, 14)

