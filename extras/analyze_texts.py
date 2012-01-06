#!/usr/bin/python
#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-06
#analyze texts, how many commands are unknown?
import extract_maps
from pretty_map_headers import map_name_cleaner
from operator import itemgetter

#how many times is each command byte called?
totals = {}
total_text_commands = 0
should_be_total = 0

def get_text_pointer(texts_pointer, text_id):
    if type(texts_pointer) == str: texts_pointer = int(texts_pointer, 16)
    if type(text_id) == str: text_id = int(text_id)

    byte1 = ord(extract_maps.rom[texts_pointer + (2*text_id)])
    byte2 = ord(extract_maps.rom[texts_pointer + (2*text_id) + 1])
    pointer = (byte1 + (byte2 << 8))

    return pointer

def how_many_until(byte, starting):
    index = extract_maps.rom.find(byte, starting)
    return index-starting

def parse_text_script(text_pointer):
    offset = text_pointer
    commands = {}
    command_counter = 0
    global total_text_commands
    
    end = False
    while not end:
        command = {}
        command_byte = ord(extract_maps.rom[offset])
        
        if  command_byte == 0:
            #read until $57
            jump = how_many_until(str(57), offset)
            end_address = offset + jump

            command = {"type": command_byte,
                       "start_address": offset,
                       "end_address": end_address,
                       "size": jump,
                      }

            offset += end_address + 1
            if not 0x0 in totals.keys(): totals[0x0] = 1
            else: totals[0x0] += 1
            total_text_commands += 1
        elif command_byte == 0x17:
            #TX_FAR [pointer][bank]
            pointer_byte1 = ord(extract_maps.rom[offset+1])
            pointer_byte2 = ord(extract_maps.rom[offset+2])
            pointer_bank = ord(extract_maps.rom[offset+3])

            pointer = (pointer_byte1 + (pointer_byte2 << 8))
            pointer = extract_maps.calculate_pointer(pointer, pointer_bank)

            command = {"type": command_byte,
                       "start_address": offset,
                       "end_address": offset + 3,
                       "pointer": pointer,
                      }

            offset += 3
            if not 0x17 in totals.keys(): totals[0x17] = 1
            else: totals[0x17] += 1
            total_text_commands += 1
        else:
            if not command_byte in totals.keys(): totals[command_byte] = 1
            else: totals[command_byte] += 1
            total_text_commands += 1
            
            end = True
            
            break

        commands[command_counter] = command
        command_counter += 1
    return commands

def analyze_texts():
    global should_be_total

    texts = {}
    for map_id in extract_maps.map_headers:
        if map_id in extract_maps.bad_maps: continue #skip
        map2 = extract_maps.map_headers[map_id]
        map2["texts"] = {}
        referenced_texts = map2["referenced_texts"]
        should_be_total += len(referenced_texts)
        texts_pointer = int(map2["texts_pointer"], 16)

        for text_id in referenced_texts:
            #print "Working on map id=" + str(map2["id"]) + " and text id=" + str(text_id)
            text_pointer = get_text_pointer(texts_pointer, text_id)
            commands = parse_text_script(text_pointer)
            map2["texts"][text_id] = commands

        texts[map_id] = map2["texts"]
        extract_maps.map_headers[map_id]["texts"] = map2["texts"]
    return texts

if __name__ == "__main__":
    extract_maps.load_rom()
    extract_maps.load_map_pointers()
    extract_maps.read_all_map_headers()
    print analyze_texts()

    print "\n\n---- stats ----\n\n"
    popular_text_commands = sorted(totals.iteritems(), key=itemgetter(1), reverse=True)
    print "popular text commands: " + str(popular_text_commands)
    print "total text commands: " + str(total_text_commands)
    print "total text scripts: " + str(should_be_total)
