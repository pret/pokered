#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-06
#analyze texts, how many commands are unknown?
import extract_maps
import analyze_incbins #for asm
try:
    from pretty_map_headers import map_name_cleaner, txt_bytes, spacing, constant_abbreviation_bytes
except Exception, exc: pass
from operator import itemgetter
import sys
debug = False #set to True to increase logging output

#how many times is each command byte called?
totals = {}
total_text_commands = 0
should_be_total = 0

def get_text_pointer(texts_pointer, text_id):
    if type(texts_pointer) == str: texts_pointer = int(texts_pointer, 16)
    if type(text_id) == str: text_id = int(text_id)

    byte1 = ord(extract_maps.rom[texts_pointer + ((text_id - 1) * 2)])
    byte2 = ord(extract_maps.rom[texts_pointer + ((text_id - 1) * 2) + 1])
    pointer = (byte1 + (byte2 << 8))

    return pointer

def how_many_until(byte, starting):
    index = extract_maps.rom.find(byte, starting)
    return index-starting

def print_command_debug_info(command_byte, text_id, text_pointer, map_id):
    if debug:
        print "byte is " + str(command_byte) + " on text #" + str(text_id) + " at " + hex(text_pointer) + " on map " + str(map_id) + " (" + extract_maps.map_headers[map_id]["name"] + ")"

def add_command_byte_to_totals(byte):
    global totals
    if not byte in totals.keys(): totals[byte] = 1
    else: totals[byte] += 1

def process_00_subcommands(start_address, end_address):
    """split this text up into multiple lines
    based on subcommands ending each line"""
    lines = {}
    subsection = extract_maps.rom[start_address:end_address+1]

    line_count = 0
    current_line = []
    for pbyte in subsection:
        byte = ord(pbyte)
        current_line.append(byte)
        if  byte == 0x4f or byte == 0x51 or byte == 0x55:
            lines[line_count] = current_line
            current_line = []
            line_count += 1

    #don't forget the last line
    lines[line_count] = current_line
    line_count += 1
    return lines

def parse_text_script(text_pointer, text_id, map_id, txfar=False):
    global total_text_commands
    offset = text_pointer
    commands = {}
    command_counter = 0

    if extract_maps.rom == None:
        extract_maps.load_rom()
    
    end = False
    while not end:
        command = {}
        command_byte = ord(extract_maps.rom[offset])
        
        print_command_debug_info(command_byte, text_id, text_pointer, map_id)
        if  command_byte == 0:
            #read until $57, $50 or $58
            jump57 = how_many_until(chr(0x57), offset)
            jump50 = how_many_until(chr(0x50), offset)
            jump58 = how_many_until(chr(0x58), offset)
            
            #whichever command comes first
            jump = min([jump57, jump50, jump58])

            end_address = offset + jump - 1 #we want the address before $57

            command = {"type": command_byte,
                       "start_address": offset,
                       "end_address": end_address,
                       "size": jump,
                       "lines": process_00_subcommands(offset+1, end_address),
                      }

            offset += jump
        elif command_byte == 0x17:
            #TX_FAR [pointer][bank]
            pointer_byte1 = ord(extract_maps.rom[offset+1])
            pointer_byte2 = ord(extract_maps.rom[offset+2])
            pointer_bank = ord(extract_maps.rom[offset+3])

            pointer = (pointer_byte1 + (pointer_byte2 << 8))
            pointer = extract_maps.calculate_pointer(pointer, pointer_bank)

            command = {"type": command_byte,
                       "start_address": offset,
                       "end_address": offset + 3, #last byte belonging to this command
                       "pointer": pointer, #parameter
                      }

            offset += 3 + 1
        elif command_byte == 0x50 or command_byte == 0x57 or command_byte == 0x58: #end text
            command = {"type": command_byte,
                       "start_address": offset,
                       "end_address": offset,
                      }

            #this byte simply indicates to end the script
            end = True
            
            #this byte simply indicates to end the script
            if command_byte == 0x50 and ord(extract_maps.rom[offset+1]) == 0x50: #$50$50 means end completely
                end = True
                commands[command_counter+1] = command

                #also save the next byte, before we quit
                commands[command_counter+1]["start_address"] += 1
                commands[command_counter+1]["end_address"] += 1
                add_command_byte_to_totals(command_byte)
            elif command_byte == 0x50: #only end if we started with $0
                if len(commands.keys()) > 0:
                    if commands[0]["type"] == 0x0: end = True
            elif command_byte == 0x57 or command_byte == 0x58: #end completely
                end = True
                offset += 1 #go past this 0x50
        elif command_byte == 0x1:
            #01 = text from RAM. [01][2-byte pointer]
            size = 3 #total size, including the command byte
            pointer_byte1 = ord(extract_maps.rom[offset+1])
            pointer_byte2 = ord(extract_maps.rom[offset+2])
            
            command = {"type": command_byte,
                       "start_address": offset+1,
                       "end_address": offset+2, #last byte belonging to this command
                       "pointer": [pointer_byte1, pointer_byte2], #RAM pointer
                      }
            
            #view near these bytes
            #subsection = extract_maps.rom[offset:offset+size+1] #peak ahead
            #for x in subsection:
            #    print hex(ord(x))
            #print "--"

            offset += 2 + 1 #go to the next byte

            #use this to look at the surrounding bytes
            if debug:
                print "next command is: " + hex(ord(extract_maps.rom[offset])) + " ... we are at command number: " + str(command_counter) + " near " + hex(offset) + " on map_id=" + str(map_id) + " for text_id=" + str(text_id) + " and txfar(recursion)=" + str(txfar)
        elif command_byte == 0x7:
            #07 = shift texts 1 row above (2nd line becomes 1st line); address for next text = 2nd line. [07]
            size = 1
            command = {"type": command_byte,
                       "start_address": offset,
                       "end_address": offset,
                      }
            offset += 1
        elif command_byte == 0x3:
            #03 = set new address in RAM for text. [03][2-byte RAM address]
            size = 3
            command = {"type": command_byte, "start_address": offset, "end_address": offset+2}
            offset += size
        elif command_byte == 0x4: #draw box
            #04 = draw box. [04][2-Byte pointer][height Y][width X]
            size = 5 #including the command
            command = {
                        "type": command_byte,
                        "start_address": offset,
                        "end_address": offset + size,
                        "pointer_bytes": [ord(extract_maps.rom[offset+1]), ord(extract_maps.rom[offset+2])],
                        "y": ord(extract_maps.rom[offset+3]),
                        "x": ord(extract_maps.rom[offset+4]),
                      }
            offset += size + 1
        elif command_byte == 0x5:
            #05 = write text starting at 2nd line of text-box. [05][text][ending command]
            #read until $57, $50 or $58
            jump57 = how_many_until(chr(0x57), offset)
            jump50 = how_many_until(chr(0x50), offset)
            jump58 = how_many_until(chr(0x58), offset)
            
            #whichever command comes first
            jump = min([jump57, jump50, jump58])

            end_address = offset + jump - 1 #we want the address before $57

            command = {"type": command_byte,
                       "start_address": offset,
                       "end_address": end_address,
                       "size": jump,
                       "lines": process_00_subcommands(offset+1, end_address),
                      }
            offset = end_address + 1
        elif command_byte == 0x6:
            #06 = wait for keypress A or B (put blinking arrow in textbox). [06]
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x7:
            #07 = shift texts 1 row above (2nd line becomes 1st line); address for next text = 2nd line. [07]
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x8:
            #08 = asm until whenever
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
            end = True
        elif command_byte == 0x9:
            #09 = write hex-to-dec number from RAM to textbox [09][2-byte RAM address][byte bbbbcccc]
            #  bbbb = how many bytes to read (read number is big-endian)
            #  cccc = how many digits display (decimal)
            #(note: max of decimal digits is 7,i.e. max number correctly displayable is 9999999)
            ram_address_byte1 = ord(extract_maps.rom[offset+1])
            ram_address_byte2 = ord(extract_maps.rom[offset+2])
            read_byte = ord(extract_maps.rom[offset+3])

            command = {
                        "type": command_byte,
                        "address": [ram_address_byte1, ram_address_byte2],
                        "read_byte": read_byte, #split this up when we make a macro for this
                      }

            offset += 4
        elif command_byte == 0xB:
            #0B = sound_86 (Hiro obtains ITEM)[same as 0F]
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0xE:
            #0E = sound_91 (learnt something)
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0xF:
            #0F = sound_86 (given rare candy)[same as 0B]
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x10:
            #10 = sound_89 (PKMN successfully caught)
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x11:
            #11 = sound_94 (Hiro gives OAK the PARCEL)
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x12:
            #12 = sound_9A (successfully caught)
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x13:
            #13 = sound_98 (song heard when "new data will be added for..")
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x14:
            #14 = MonCry (Nidorina)
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x15:
            #14 = MonCry (Pidgeot)
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x16:
            #14 = MonCry (Dewgong)
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x19:
            #19 = play a 'bump' noise
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x1F:
            #1F = play some pokemon's roar, don't know which..
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x20:
            #20 = oddish roar?
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x3F:
            #3F = some other roar
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x9D:
            #9D = a roar or some other sound, four times in quick succession
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x76:
            #76 = another roar
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0xCA:
            #CA = stop music, start this other song that i can't name
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0xF6:
            #F6 = play a 'blurp blurp' noise.. like something is increasing
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0xFA:
            #FA = change music to champion song?
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0xFE:
            #FE = another roar, kinda glitchy?
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0xFF:
            #FF = change music to a specific song that i don't know the name of
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        else:
            #if len(commands) > 0:
            #   print "Unknown text command " + hex(command_byte) + " at " + hex(offset) + ", script began with " + hex(commands[0]["type"])
            if debug:
                print "Unknown text command at " + hex(offset) + " - command: " + hex(ord(extract_maps.rom[offset])) + " on map_id=" + str(map_id) + " text_id=" + str(text_id)
            
            #end at the first unknown command
            end = True
        add_command_byte_to_totals(command_byte)

        commands[command_counter] = command
        command_counter += 1
    total_text_commands += len(commands)
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
        
        #print "Checking texts on... map_id=" + str(map_id) + " and len(referenced_texts)=" + str(len(referenced_texts))
        for text_id in referenced_texts:
            text_pointer = get_text_pointer(texts_pointer, text_id)
            if 0x4000 <= text_pointer <= 0x7fff: #only care about bank when it's between 4000-7fff
                text_pointer = extract_maps.calculate_pointer(text_pointer, int(map2["bank"], 16))
            #print "Working on map id=" + str(map2["id"]) + " and text id=" + str(text_id)
            #print "for map_id=" + str(map_id) + " texts_pointer=" + hex(texts_pointer) + " text_id=" + str(text_id) + " the pointer=" + hex(text_pointer)
            commands = parse_text_script(text_pointer, text_id, map_id)

            #process TX_FARs
            for command_id in commands:
                #skip commands starting with an unknown command byte
                if len(commands[command_id]) == 0: continue

                if commands[command_id]["type"] == 0x17:
                    TX_FAR = parse_text_script(commands[command_id]["pointer"], text_id, map_id, txfar=True)
                    if debug:
                        if len(TX_FAR.keys()) > 0:
                            #print "TX_FAR object: " + str(TX_FAR)
                            print "processing a TX_FAR at " + hex(commands[command_id]["pointer"]) + "... first byte is: " + str(ord(extract_maps.rom[commands[command_id]["pointer"]])) + " .. offset: " + hex(commands[command_id]["pointer"])
                            ##sys.exit(0)

                    commands[command_id]["TX_FAR"] = TX_FAR
                    #map2["texts"][text_id][command_id]["TX_FAR"] = parse_text_script(command["pointer"], text_id, map_id)
            map2["texts"][text_id] = commands

        texts[map_id] = map2["texts"]
        extract_maps.map_headers[map_id]["texts"] = map2["texts"]
    return texts

def find_missing_08s(all_texts):
    """determines which $08s have yet to be inserted
    based on their start addresses"""
    missing_08s = 0
    for map_id in all_texts.keys():
        for text_id in all_texts[map_id].keys():
            for line_id in all_texts[map_id][text_id].keys():
                if not line_id == 0:
                    current_line = all_texts[map_id][text_id][line_id]
                    if "type" in current_line.keys():
                        if current_line["type"] == 0x8:
                            missing_08s += 1
                            print "missing $08 on map_id=" + str(map_id) + " text_id=" + str(text_id) + " line_id=" + str(line_id) + " at " + hex(current_line["start_address"])
    return missing_08s

def text_pretty_printer_at(start_address, label="SomeLabel"):
    commands = parse_text_script(start_address, None, None)
    needs_to_begin_with_0 = True #how should this be determined?
    
    #wanted_command = None
    #if needs_to_begin_with_0:
    #    wanted_command = None
    #    for command_id in commands:
    #        command = commands[command_id]
    #        if command["type"] == 0:
    #            wanted_command = command_id
    #
    #    if wanted_command == None:
    #        raise "error: address did not start with a $0 text"
    
    #start with zero please
    byte_count = 0

    output = ""
    had_text_end_byte = False
    had_text_end_byte_57_58 = False
    had_db_last = False
    first_line = True
    for this_command in commands.keys():
        if not "lines" in commands[this_command].keys():
            command = commands[this_command]
            if not "type" in command.keys():
                print "ERROR in command: " + str(command)
                continue #dunno what to do here?

            if   command["type"] == 0x1: #TX_RAM
                if first_line:
                    output = "\n"
                    output += label + ": ; " + hex(start_address)
                    first_line = False
                p1 = command["pointer"][0]
                p2 = command["pointer"][1]

                #remember to account for big endian -> little endian
                output += "\n" + spacing + "TX_RAM $%.2x%.2x" %(p2, p1) 
                byte_count += 3
                had_db_last = False
            elif command["type"] == 0x17: #TX_FAR
                if first_line:
                    output = "\n"
                    output += label + ": ; " + hex(start_address)
                    first_line = False
                #p1 = command["pointer"][0]
                #p2 = command["pointer"][1]
                output += "\n" + spacing + "TX_FAR _" + label + " ; " + hex(command["pointer"])
                byte_count += 4 #$17, bank, address word
                had_db_last = False
            elif command["type"] == 0x9: #TX_RAM_HEX2DEC
                if first_line:
                    output = "\n" + label + ": ; " + hex(start_address)
                    first_line = False
                #address, read_byte
                output += "\n" + spacing + "TX_NUM $%.2x%.2x, $%.2x" % (command["address"][1], command["address"][0], command["read_byte"])
                had_db_last = False
                byte_count += 4
            elif command["type"] == 0x50 and not had_text_end_byte:
                #had_text_end_byte helps us avoid repeating $50s
                if first_line:
                    output = "\n" + label + ": ; " + hex(start_address)
                    first_line = False
                if had_db_last:
                    output += ", $50"
                else:
                    output += "\n" + spacing + "db $50"
                byte_count += 1
                had_db_last = True
            elif command["type"] in [0x57, 0x58] and not had_text_end_byte_57_58:
                if first_line: #shouldn't happen, really
                    output = "\n" + label + ": ; " + hex(start_address)
                    first_line = False
                if had_db_last:
                    output += ", $%.2x" % (command["type"])
                else:
                    output += "\n" + spacing + "db $%.2x" % (command["type"])
                byte_count += 1
                had_db_last = True
            elif command["type"] in [0x57, 0x58] and had_text_end_byte_57_58:
                pass #this is ok
            elif command["type"] == 0x50 and had_text_end_byte:
                pass #this is also ok
            elif command["type"] == 0x0b:
                if first_line:
                    output = "\n" + label + ": ; " + hex(start_address)
                    first_line = False
                if had_db_last:
                    output += ", $0b"
                else:
                    output += "\n" + spacing + "db $0B"
                byte_count += 1
                had_db_last = True
            elif command["type"] == 0x11:
                if first_line:
                    output = "\n" + label + ": ; " + hex(start_address)
                    first_line = False
                if had_db_last:
                    output += ", $11"
                else:
                    output += "\n" + spacing + "db $11"
                byte_count += 1
                had_db_last = True
            elif command["type"] == 0x6: #wait for keypress
                if first_line:
                    output = "\n" + label + ": ; " + hex(start_address)
                    first_line = False
                if had_db_last:
                    output += ", $6"
                else:
                    output += "\n" + spacing + "db $6"
                byte_count += 1
                had_db_last = True
            else:
                print "ERROR in command: " + hex(command["type"])
                had_db_last = False

            #everything else is for $0s, really
            continue
        lines = commands[this_command]["lines"]

        #reset this in case we have non-$0s later
        had_db_last = False
    
        #add the ending byte to the last line- always seems $57
        #this should already be in there, but it's not because of a bug in the text parser
        lines[len(lines.keys())-1].append(commands[len(commands.keys())-1]["type"])
    
        if first_line:
            output  = "\n"
            output += label + ": ; " + hex(start_address) + "\n"
            first_line = False
        else:
            output += "\n"

        first = True #first byte
        for line_id in lines:
            line = lines[line_id]
            output += spacing + "db "
            if first and needs_to_begin_with_0:
                output += "$0, "
                first = False
                byte_count += 1
         
            quotes_open = False
            first_byte = True
            was_byte = False
            for byte in line:
                if byte == 0x50:
                    had_text_end_byte = True #don't repeat it
                if byte in [0x58, 0x57]:
                    had_text_end_byte_57_58 = True

                if byte in txt_bytes:
                    if not quotes_open and not first_byte: #start text
                        output += ", \""
                        quotes_open = True
                        first_byte = False
                    if not quotes_open and first_byte: #start text
                        output += "\""
                        quotes_open = True
                    output += txt_bytes[byte]
                elif byte in constant_abbreviation_bytes:
                    if quotes_open:
                        output += "\""
                        quotes_open = False
                    if not first_byte:
                        output += ", "
                    output += constant_abbreviation_bytes[byte]
                else:
                    if quotes_open:
                        output += "\""
                        quotes_open = False
    
                    #if you want the ending byte on the last line
                    #if not (byte == 0x57 or byte == 0x50 or byte == 0x58):
                    if not first_byte:
                        output += ", "
    
                    output += "$" + hex(byte)[2:]
                    was_byte = True
    
                    #add a comma unless it's the end of the line
                    #if byte_count+1 != len(line):
                    #    output += ", "
    
                first_byte = False
                byte_count += 1
            #close final quotes
            if quotes_open:
                output += "\""
                quotes_open = False
    
            output += "\n"
    include_newline = "\n"
    if len(output)!=0 and output[-1] == "\n":
        include_newline = ""
    output += include_newline + "; " + hex(start_address) + " + " + str(byte_count) + " bytes = " + hex(start_address + byte_count)
    print output
    return (output, byte_count)

def is_label_in_asm(label):
    for line in analyze_incbins.asm:
        if label in line:
            if line[0:len(label)] == label:
                return True
    return False

def find_undone_texts():
    usable_table = {}
    if analyze_incbins.asm == None:
        analyze_incbins.load_asm()

    for map_id in extract_maps.map_headers:
        #skip bad maps
        if map_id in extract_maps.bad_maps: continue

        map2 = extract_maps.map_headers[map_id]
        name = map_name_cleaner(map2["name"], None)[:-2] + "Text"

        for text_id in map2["referenced_texts"]:
            label = name + str(text_id)

            if len(extract_maps.map_headers[map_id]["texts"][text_id].keys()) == 0: continue
            if len(extract_maps.map_headers[map_id]["texts"][text_id][0].keys()) == 0: continue

            try:
                address = extract_maps.map_headers[map_id]["texts"][text_id][0]["start_address"]
            except:
                address = extract_maps.map_headers[map_id]["texts"][text_id][1]["start_address"]
            
            if not is_label_in_asm(label):
                print label + " map_id=" + str(map_id) + " text_id=" + str(text_id) + " at " + hex(address) + " byte is: " + hex(ord(extract_maps.rom[address]))
                if not address in usable_table.keys():
                    usable_table[address] = 1
                else:
                    usable_table[address] += 1

    print "\n\n which ones are priority?"
    sorted_results =  sorted(usable_table.iteritems(), key=itemgetter(1), reverse=True)
    for result in sorted_results:
        print str(result[1]) + " times: " + hex(result[0])

def scan_rom_for_tx_fars(printer=True):
    """find TX_FARs
    search only addresses that are INCBINed
    keep only TX_FARs that are valid
    
    returns a list of [TX_FAR target address, TX_FAR address]"""
    rom = extract_maps.rom

    analyze_incbins.load_asm()
    analyze_incbins.isolate_incbins()
    analyze_incbins.process_incbins()

    possible_tx_fars = []
    possible_tx_far_targets = []
    
    for incbin_line_number in analyze_incbins.processed_incbins.keys():
        incbin = analyze_incbins.processed_incbins[incbin_line_number]
        start_address = incbin["start"]
        end_address = incbin["end"]
        if incbin["interval"] == 0: continue #skip this one

        subrom = rom[start_address:end_address]
        for address in range(start_address, end_address):
            current_byte = ord(rom[address])
            if current_byte == 0x17:
                if ord(rom[address+4]) == 0x50:
                    byte1 = ord(rom[address+1])
                    byte2 = ord(rom[address+2])
                    address2 = byte1 + (byte2 << 8)
                    if address2 > 0x3fff:
                        address2 = extract_maps.calculate_pointer(address2, ord(rom[address+3]))
                    #print "possible TX_FAR at " + hex(address) + " to " + hex(address2)

                    possible_tx_fars.append(address)
                    possible_tx_far_targets.append([address2, address])

    if printer:
        pre_handled = []
        #address_bundle is [TX_FAR target address, TX_FAR address]
        for address_bundle in possible_tx_far_targets:
            if address_bundle[0] in [0xa82f8, 0xa8315]:
                continue #bad
            if address_bundle[0] in pre_handled:
                continue #already did this
    
            print "-------"
            print "TX_FAR is at: " + hex(address_bundle[1])
            
            #let's try printing out the TX_FAR?
            text_pretty_printer_at(address_bundle[1], "blah")

            text_pretty_printer_at(address_bundle[0], "_blah")
            print "-------"
            pre_handled.append(address_bundle[0])
    return possible_tx_far_targets

if __name__ == "__main__":
    extract_maps.load_rom()
    extract_maps.load_map_pointers()
    extract_maps.read_all_map_headers()
    #text_output = analyze_texts()
    #print text_output

    #these aren't really "missing", just a certain type that was
    #known to be missed on a first pass.
    #missing_08s = find_missing_08s(text_output)

    #print "\n\n---- stats ----\n\n"
    
    #popular_text_commands = sorted(totals.iteritems(), key=itemgetter(1), reverse=True)
    #convert the first values (command byte) to hex
    #for popular_item in popular_text_commands:
    #    print hex(popular_item[0]) + " was used " + str(popular_item[1]) + " times."
    #print "popular text commands: " + str(popular_text_commands)
    
    #print "total text commands: " + str(total_text_commands)
    #print "total text scripts: " + str(should_be_total)
    #print "missing 08s: " + str(missing_08s)
    #print "\n\n"

    #text_pretty_printer_at(0x800b1)
    #find_undone_texts()

    scan_rom_for_tx_fars()
