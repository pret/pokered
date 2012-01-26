#!/usr/bin/python2.7
#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-07, 2012-01-17
#insert TX_FAR targets into pokered.asm
import extract_maps
from analyze_texts import analyze_texts, text_pretty_printer_at, scan_rom_for_tx_fars
from pretty_map_headers import map_name_cleaner, make_text_label, map_constants, find_all_tx_fars, tx_far_pretty_printer, tx_far_label_maker
import pretty_map_headers
from analyze_incbins import asm, offset_to_pointer, find_incbin_to_replace_for, split_incbin_line_into_three, generate_diff_insert, load_asm, isolate_incbins, process_incbins, reset_incbins, apply_diff
import analyze_incbins
from gbz80disasm import text_asm_pretty_printer, output_bank_opcodes
import os, sys
import subprocess
spacing = "	"
tx_fars = None
failed_attempts = {}

def local_reset_incbins():
    asm = None
    incbin_lines = []
    processed_incbins = {}
    analyze_incbins.asm = None
    analyze_incbins.incbin_lines = []
    analyze_incbins.processed_incbins = {}
    
    #reload
    load_asm()
    isolate_incbins()
    process_incbins()

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

def insert_all_tx_far_targets():
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

def all_texts_are_tx_fars(map_id):
    map2 = extract_maps.map_headers[map_id]
    for text_id in map2["texts"]:
        txt = map2["texts"][text_id]
        if not "TX_FAR" in txt[0].keys(): return False
    return True

def texts_label_pretty_printer(map_id):
    "output a texts label for map if all texts are TX_FARs and in the asm already"
    #extract_maps.map_headers[map_id]["texts"][text_id][0]["TX_FAR"]
    #if not all_texts_are_tx_fars(map_id): return None
    map2 = extract_maps.map_headers[map_id]

    #pointer to the list of texts
    texts_list_pointer = int(map2["texts_pointer"], 16)

    #get the label for this texts list
    base_label = map_name_cleaner(map2["name"], None)[:-2]
    label = base_label + "Texts"

    #make up a label for each text
    text_labels = []
    text_id = 1
    for text in map2["texts"].keys():
        text_label = base_label + "Text" + str(text_id)
        text_labels.append(text_label)
        text_id += 1
    
    output = label + ": ; " + hex(texts_list_pointer)
    output += "\n"
    output += spacing + "dw "

    first = True
    for labela in text_labels:
        if not first:
            output += ", " + labela
        else:
            output += labela
            first = False

    return output

def insert_texts_label(map_id):
    #if not all_texts_are_tx_fars(map_id): return None
    map2 = extract_maps.map_headers[map_id]
    
    base_label = map_name_cleaner(map2["name"], None)[:-2]
    label = base_label + "Texts"
    texts_pointer = int(map2["texts_pointer"], 16)

    insert_asm = texts_label_pretty_printer(map_id)

    line_number = find_incbin_to_replace_for(texts_pointer)
    if line_number == None:
        print "skipping texts label for map_id=" + str(map_id) + " texts_pointer=" + hex(texts_pointer) + " because the address is taken"
        return

    #also do a name check
    if (label + ":") in "\n".join(analyze_incbins.asm):
        print "skipping texts label for map_id=" + str(map_id) + " texts_pointer=" + hex(texts_pointer) + " because the label is already used"
        return
    
    newlines = split_incbin_line_into_three(line_number, texts_pointer, len(map2["referenced_texts"])*2 )

    newlines = newlines.split("\n")
    if len(newlines) == 2: index = 0 #replace the 1st line with new content
    elif len(newlines) == 3: index = 1 #replace the 2nd line with new content
    
    newlines[index] = insert_asm

    if len(newlines) == 3 and newlines[2][-2:] == "$0":
        #get rid of the last incbin line if it is only including 0 bytes
        del newlines[2]
        #note that this has to be done after adding in the new asm
    newlines = "\n".join(line for line in newlines)
    newlines = newlines.replace("$x", "$")

    diff = generate_diff_insert(line_number, newlines)
    print "working on map_id=" + str(map_id) + " texts_pointer=" + hex(texts_pointer)
    print diff
    apply_diff(diff)

#untested as of 2012-01-07
def insert_all_texts_labels():
    for map_id in extract_maps.map_headers.keys():
        if map_id not in extract_maps.bad_maps:
            if len(extract_maps.map_headers[map_id]["referenced_texts"]) > 0:
                insert_texts_label(map_id)
        
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

def txt_to_tx_far_pretty_printer(address, label, target_label, include_byte=False):
    output = "\n" + label + ": ; " + hex(address) + "\n"
    output += spacing + "TX_FAR " + target_label + "\n"
    if include_byte:
        output += spacing + "db $50\n"
    return output

def insert_text_label_tx_far(map_id, text_id):
    if map_id in extract_maps.bad_maps:
        print "bad map id=" + str(map_id)
        return
    map2 = extract_maps.map_headers[map_id]
    if map2["texts"][text_id] == {0: {}}: return None

    base_label = map_name_cleaner(map2["name"], None)[:-2]
    label = base_label + "Text" + str(text_id)
    target_label = "_" + label
    start_address = map2["texts"][text_id][0]["start_address"]
    if 0x4000 <= start_address <= 0x7fff:
        start_address = extract_maps.calculate_pointer(start_address, int(map2["bank"],16))
    include_byte = False
    print map2["texts"][text_id]
    if "type" in map2["texts"][text_id][1].keys():
        if map2["texts"][text_id][1]["type"] == 0x50:
            include_byte = True
    tx_far_asm = txt_to_tx_far_pretty_printer(start_address, label, target_label, include_byte=include_byte)
    
    line_number = find_incbin_to_replace_for(start_address)
    if line_number == None:
        print "skipping text label that calls TX_FAR for map_id=" + str(map_id) + " text_id=" + str(text_id) + " because the address is taken " + hex(start_address)
        return

    #also do a name check
    if 1 < ("\n".join(analyze_incbins.asm)).count("\n" + label + ":"):
        print "skipping text label that calls TX_FAR for map_id=" + str(map_id) + " text_id" + str(text_id) + " because the label is already used (" + label + ":)"
        return
    
    extra = 0
    if include_byte: extra += 1
    newlines = split_incbin_line_into_three(line_number, start_address, 4 + extra )

    newlines = newlines.split("\n")
    if len(newlines) == 2: index = 0 #replace the 1st line with new content
    elif len(newlines) == 3: index = 1 #replace the 2nd line with new content
    
    newlines[index] = tx_far_asm

    if len(newlines) == 3 and newlines[2][-2:] == "$0":
        #get rid of the last incbin line if it is only including 0 bytes
        del newlines[2]
        #note that this has to be done after adding in the new asm
    newlines = "\n".join(line for line in newlines)

    newlines = newlines.replace("$x", "$")

    diff = generate_diff_insert(line_number, newlines)
    print "working on map_id=" + str(map_id) + " text_id=" + str(text_id)
    print diff
    apply_diff(diff)

def insert_all_text_labels():
    for map_id in extract_maps.map_headers.keys():
        if map_id <= 100: continue #skip
        if map_id not in extract_maps.bad_maps:
            for text_id in extract_maps.map_headers[map_id]["referenced_texts"]:
                insert_text_label_tx_far(map_id, text_id)
        
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

#TODO: if line_id !=0 then don't include the label?
def insert_08_asm(map_id, text_id, line_id=0):
    map2 = extract_maps.map_headers[map_id]
    base_label = map_name_cleaner(map2["name"], None)[:-2]
    label = base_label + "Text" + str(text_id)

    start_address = all_texts[map_id][text_id][line_id]["start_address"]

    (text_asm, end_address) = text_asm_pretty_printer(label, start_address)
    print "end address is: " + hex(end_address)

    #find where to insert the assembly
    line_number = find_incbin_to_replace_for(start_address)
    if line_number == None:
        print "skipping text label for a $08 on map_id=" + str(map_id) + " text_id=" + str(text_id) + " because the address is taken"
        return

    #also do a name check
    if 1 <= ("\n".join(analyze_incbins.asm)).count("\n" + label + ":"):
        print "skipping text label for a $08 on map_id=" + str(map_id) + " text_id=" + str(text_id) + " because the label is already taken (" + label + ":)"
        return
    
    newlines = split_incbin_line_into_three(line_number, start_address, end_address - start_address )
    
    newlines = newlines.split("\n")
    if len(newlines) == 2: index = 0 #replace the 1st line with new content
    elif len(newlines) == 3: index = 1 #replace the 2nd line with new content
    
    newlines[index] = text_asm

    if len(newlines) == 3 and newlines[2][-2:] == "$0":
        #get rid of the last incbin line if it is only including 0 bytes
        del newlines[2]
        #note that this has to be done after adding in the new asm
    newlines = "\n".join(line for line in newlines)

    newlines = newlines.replace("$x", "$")

    diff = generate_diff_insert(line_number, newlines)
    print "working on map_id=" + str(map_id) + " text_id=" + str(text_id)
    print diff
    result = apply_diff(diff)

    if result == False:
        failed_attempts[len(failed_attempts.keys())] = {"map_id": map_id, "text_id": text_id}

def find_all_08s():
    all_08s = []
    for map_id in all_texts:
        for text_id in all_texts[map_id].keys():
            if 0 in all_texts[map_id][text_id].keys():
                for line_id in all_texts[map_id][text_id].keys():
                    if all_texts[map_id][text_id][line_id]["type"] == 0x8:
                        all_08s.append([map_id, text_id, line_id])
    return all_08s

def insert_all_08s():
    all_08s = find_all_08s()
    for the_08_line in all_08s:
        map_id = the_08_line[0]
        if map_id <= 86: continue #speed things up
        text_id = the_08_line[1]
        line_id = the_08_line[2]

        print "processing map_id=" + str(map_id) + " text_id=" + str(text_id)
        insert_08_asm(map_id, text_id, line_id)
        
        #reset everything
        analyze_incbins.reset_incbins()
        asm = None
        incbin_lines = []
        processed_incbins = {}
        analyze_incbins.asm = None
        analyze_incbins.incbin_lines = []
        analyze_incbins.processed_incbins = {}

        #reload
        load_asm()
        isolate_incbins()
        process_incbins()

def insert_asm(start_address, label, text_asm=None, end_address=None):
    if text_asm == None and end_address == None:
        (text_asm, end_address) = text_asm_pretty_printer(label, start_address, include_08=False)
        print "end address is: " + hex(end_address)

    #find where to insert the assembly
    line_number = find_incbin_to_replace_for(start_address)
    if line_number == None:
        print "skipping asm because the address is taken"
        return False

    #name check
    if (label + ":") in "\n".join(analyze_incbins.asm):
        print "skipping asm because the label is taken"
        return False

    newlines = split_incbin_line_into_three(line_number, start_address, end_address - start_address )
    
    newlines = newlines.split("\n")
    if len(newlines) == 2: index = 0 #replace the 1st line with new content
    elif len(newlines) == 3: index = 1 #replace the 2nd line with new content
    
    newlines[index] = text_asm

    if len(newlines) == 3 and newlines[2][-2:] == "$0":
        #get rid of the last incbin line if it is only including 0 bytes
        del newlines[2]
        #note that this has to be done after adding in the new asm
    newlines = "\n".join(line for line in newlines)

    newlines = newlines.replace("$x", "$")

    diff = generate_diff_insert(line_number, newlines)
    print diff
    result = apply_diff(diff, try_fixing=True)
    return True

def insert_text(address, label, apply=False, try_fixing=True):
    "inserts a text script (but not $8s)"
    start_address = address

    line_number = find_incbin_to_replace_for(start_address)
    if line_number == None:
        print "skipping text at " + hex(start_address) + " with address " + label
        return "skip"

    #another reason to skip is if the interval is 0
    processed_incbin = analyze_incbins.processed_incbins[line_number]
    if processed_incbin["interval"] == 0:
        print "skipping text at " + hex(start_address) + " with address " + label + " because the interval is 0"
        return "skip"

    text_asm, byte_count = text_pretty_printer_at(start_address, label)
    end_address = start_address + byte_count
    newlines = split_incbin_line_into_three(line_number, start_address, byte_count)

    newlines = newlines.split("\n")
    if len(newlines) == 2: index = 0 #replace the 1st line with new content
    elif len(newlines) == 3: index = 1 #replace the 2nd line with new content
    
    newlines[index] = text_asm

    if len(newlines) == 3 and newlines[2][-2:] == "$0":
        #get rid of the last incbin line if it is only including 0 bytes
        del newlines[2]
        #note that this has to be done after adding in the new asm
    newlines = "\n".join(line for line in newlines)
    newlines = newlines.replace("$x", "$") #where does this keep coming from??

    #Char52 doesn't work yet
    newlines = newlines.replace("Char52", "$52")

    diff = generate_diff_insert(line_number, newlines)
    print diff
    if apply:
        return apply_diff(diff, try_fixing=try_fixing)
    else: #simulate a successful insertion
        return True

#move this into another file?
def scan_for_map_scripts_pointer():
    for map_id in extract_maps.map_headers.keys(): #skip id=0 (Pallet Town) because the naming conventions are wonky
        map2 = extract_maps.map_headers[map_id]
        if map_id in extract_maps.bad_maps or map_id in [0, 39, 37, 38]: continue #skip
        script_pointer = int(map2["script_pointer"], 16)

        main_asm_output, offset, last_hl_address, last_a_address, used_3d97 = output_bank_opcodes(script_pointer)
        hl_pointer = "None"
        
        first_script_text = ""
        if last_hl_address != None and last_hl_address != "None" and used_3d97==True:
            if last_hl_address > 0x3fff:
                hl_pointer = extract_maps.calculate_pointer(last_hl_address, int(map2["bank"], 16))
            else:
                hl_pointer = last_hl_address
            byte1 = ord(extract_maps.rom[hl_pointer])
            byte2 = ord(extract_maps.rom[hl_pointer+1])
            address = byte1 + (byte2 << 8)

            if address > 0x3fff:
                first_script_pointer = extract_maps.calculate_pointer(address, int(map2["bank"], 16))
            else:
                first_script_pointer = address

            #for later output
            first_script_text = " first_script=" + hex(first_script_pointer)

            #go ahead and insert this script pointer
            insert_asm(first_script_pointer, map_name_cleaner(map2["name"], None)[:-2] + "Script0")
            
            #reset everything
            #analyze_incbins.reset_incbins()
            asm = None
            incbin_lines = []
            processed_incbins = {}
            analyze_incbins.asm = None
            analyze_incbins.incbin_lines = []
            analyze_incbins.processed_incbins = {}
    
            #reload
            load_asm()
            isolate_incbins()
            process_incbins()

            a_numbers = [0]
            last_a_id = 0
            script_pointers = [hex(first_script_pointer)]
            latest_script_pointer = first_script_pointer
            while last_a_id == (max(a_numbers)) or last_a_id==0:
                asm_output, offset, last_hl_address2, last_a_id, byte1, byte2, address = None, None, None, None, None, None, None
                asm_output, offset, last_hl_address2, last_a_id, used_3d97_2 = output_bank_opcodes(latest_script_pointer)
                
                if last_a_id == (max(a_numbers) + 1):
                    a_numbers.append(last_a_id)
                else:
                    break
                
                byte1 = ord(extract_maps.rom[hl_pointer + (2*last_a_id)])
                byte2 = ord(extract_maps.rom[hl_pointer + (2*last_a_id) + 1])
                address2 = byte1 + (byte2 << 8)
                if address2 > 0x3fff:
                    latest_script_pointer = extract_maps.calculate_pointer(address2, int(map2["bank"], 16))
                else:
                    latest_script_pointer = address2

                script_pointers.append(hex(latest_script_pointer))
                #print "latest script pointer (part 1): " + hex(address2)
                #print "latest script pointer: " + hex(latest_script_pointer)

                #go ahead and insert the asm for this script
                result = insert_asm(latest_script_pointer, map_name_cleaner(map2["name"], None)[:-2] + "Script" + str(len(script_pointers) - 1))
                
                if result:
                    #reset everything
                    #analyze_incbins.reset_incbins()
                    asm = None
                    incbin_lines = []
                    processed_incbins = {}
                    analyze_incbins.asm = None
                    analyze_incbins.incbin_lines = []
                    analyze_incbins.processed_incbins = {}
            
                    #reload
                    load_asm()
                    isolate_incbins()
                    process_incbins()

            print "map_id=" + str(map_id) + " scripts are: " + str(script_pointers)
        
        if last_hl_address == None: last_hl_address = "None"
        else: last_hl_address = hex(last_hl_address)

        if hl_pointer != None and hl_pointer != "None": hl_pointer = hex(hl_pointer)

        print "map_id=" + str(map_id) + " " + map2["name"] + " script_pointer=" + hex(script_pointer) + " script_pointers=" + hl_pointer + first_script_text
        print main_asm_output
        print "\n\n"

        #insert asm for the main script
        result = insert_asm(script_pointer, map_name_cleaner(map2["name"], None)[:-2] + "Script")
        
        if result:
            #reset everything
            #analyze_incbins.reset_incbins()
            asm = None
            incbin_lines = []
            processed_incbins = {}
            analyze_incbins.asm = None
            analyze_incbins.incbin_lines = []
            analyze_incbins.processed_incbins = {}
    
            #reload
            load_asm()
            isolate_incbins()
            process_incbins()

        #insert script pointer list asm if there's anything of value
        if hl_pointer != None and hl_pointer != "None" and used_3d97==True:
            start_address = int(hl_pointer, 16) #where to insert this list
            total_size = len(a_numbers) * 2
            
            script_label = map_name_cleaner(map2["name"], None)[:-2] + "Script"
            scripts_label = script_label  + "s"
            script_asm = scripts_label + ": ; " + hex(start_address) + "\n"
            script_asm += spacing + "dw"

            first = True
            for id in a_numbers:
                if first:
                    script_asm += " "
                    first = False
                else:
                    script_asm += ", "
                script_asm += script_label + str(id)
            script_asm += "\n" #extra newline?

            result = insert_asm(start_address, scripts_label, text_asm=script_asm, end_address=start_address + total_size)
            if result:
                #reset everything
                #analyze_incbins.reset_incbins()
                asm = None
                incbin_lines = []
                processed_incbins = {}
                analyze_incbins.asm = None
                analyze_incbins.incbin_lines = []
                analyze_incbins.processed_incbins = {}
        
                #reload
                load_asm()
                isolate_incbins()
                process_incbins()
            else:
                print "trouble inserting map script pointer list"
                print script_asm
                sys.exit(0)

def scan_rom_for_tx_fars_and_insert():
    """calls analyze_texts.scan_rom_for_tx_fars()
    looks through INCBIN'd addresses from main.asm,
    finds TX_FARs that aren't included yet.
    """
    x = 0
    address_bundles = scan_rom_for_tx_fars(printer=True)
    for address_bundle in address_bundles:
        tx_far_address = address_bundle[1]
        tx_far_target_address = address_bundle[0]
        if tx_far_address in [0xeff2]: continue #skip
        #if tx_far_address < 0x7627b: continue #because it stopped a few times for errors

        tx_far_label = "UnnamedText_%.2x" % (tx_far_address)
        tx_far_target_label = "_" + tx_far_label

        #let's also do a quick check if it might be in the file already
        if not (": ; " + hex(tx_far_address) in analyze_incbins.asm):
            print "inserting text at " + hex(tx_far_address)
            result = insert_text(tx_far_target_address, tx_far_target_label, apply=True)
        else:
            #we can't just pretend like it worked, because we don't know what label was used
            #so, figure out the label
            for line in analyze_incbins.asm_lines:
                if ": ; " + hex(tx_far_address) in line:
                    tx_far_target_label = line.split(":")[0]
            result = "skip"

        if result == True or result == None:
            local_reset_incbins()
            result2 = insert_text(tx_far_address, tx_far_label, apply=True)
            local_reset_incbins()
        elif result == "skip":
            print "skipping " + hex(tx_far_address)
        #    result2 = insert_text(tx_far_address, tx_far_label, apply=True)
        #    local_reset_incbins()

        #just skip these for now
        #if not result or not result2:
        #    sys.exit(0)

if __name__ == "__main__":
    #load map headers and object data
    extract_maps.load_rom()
    extract_maps.load_map_pointers()
    extract_maps.read_all_map_headers()

    #load texts (these two have different formats)
    #all_texts = pretty_map_headers.analyze_texts.analyze_texts()
    #pretty_map_headers.all_texts = all_texts
    #tx_fars = pretty_map_headers.find_all_tx_fars()

    #load incbins
    reset_incbins()

    #scan_for_map_scripts_pointer()
    scan_rom_for_tx_fars_and_insert()
    #insert_text(0xa586b, "_VermilionCityText14")

    #insert _ViridianCityText10
    #insert_tx_far(1, 10)

    #just me testing a pokemart sign duplicate
    #insert_tx_far(3, 14)

    #this is the big one
    #insert_all_tx_far_targets()
    
    #for map_id in extract_maps.map_headers.keys():
    #    if map_id not in extract_maps.bad_maps:
    #        if len(extract_maps.map_headers[map_id]["referenced_texts"]) > 0:
    #            texts_label_pretty_printer(map_id)
    
    #insert_texts_label(240)
    #insert_all_texts_labels()

    #insert_text_label_tx_far(240, 1)
    #insert_all_text_labels()

    #insert_08_asm(83, 1)
    #insert_all_08s()

    #insert_asm(0x1da56, "NameRaterText1")
    #insert_text_label_tx_far(91, 1)

    #insert_text(0x44276, "ViridianPokeCenterText4")
    #insert_texts_label(4)
    #insert_all_texts_labels()

