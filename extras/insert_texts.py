#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-07, 2012-01-17, 2012-01-27
#insert TX_FAR targets into pokered.asm
#and other insertion tasks
import extract_maps
from analyze_texts import analyze_texts, text_pretty_printer_at, scan_rom_for_tx_fars
from pretty_map_headers import map_name_cleaner, make_text_label, map_constants, find_all_tx_fars, tx_far_pretty_printer, tx_far_label_maker
import pretty_map_headers
from analyze_incbins import asm, offset_to_pointer, find_incbin_to_replace_for, split_incbin_line_into_three, generate_diff_insert, load_asm, isolate_incbins, process_incbins, reset_incbins, apply_diff
import analyze_incbins
from gbz80disasm import text_asm_pretty_printer, output_bank_opcodes, load_labels, find_label
import os, sys
import subprocess
spacing = "	"
tx_fars = None
failed_attempts = {}

pokemons = ["BULBASAUR", "IVYSAUR", "VENUSAUR", "CHARMANDER", "CHARMELEON", "CHARIZARD", "SQUIRTLE", "WARTORTLE", "BLASTOISE", "CATERPIE", "METAPOD", "BUTTERFREE", "WEEDLE", "KAKUNA", "BEEDRILL", "PIDGEY", "PIDGEOTTO", "PIDGEOT", "RATTATA", "RATICATE", "SPEAROW", "FEAROW", "EKANS", "ARBOK", "PIKACHU", "RAICHU", "SANDSHREW", "SANDSLASH", "NIDORANF", "NIDORINA", "NIDOQUEEN", "NIDORANM", "NIDORINO", "NIDOKING", "CLEFAIRY", "CLEFABLE", "VULPIX", "NINETALES", "JIGGLYPUFF", "WIGGLYTUFF", "ZUBAT", "GOLBAT", "ODDISH", "GLOOM", "VILEPLUME", "PARAS", "PARASECT", "VENONAT", "VENOMOTH", "DIGLETT", "DUGTRIO", "MEOWTH", "PERSIAN", "PSYDUCK", "GOLDUCK", "MANKEY", "PRIMEAPE", "GROWLITHE", "ARCANINE", "POLIWAG", "POLIWHIRL", "POLIWRATH", "ABRA", "KADABRA", "ALAKAZAM", "MACHOP", "MACHOKE", "MACHAMP", "BELLSPROUT", "WEEPINBELL", "VICTREEBEL", "TENTACOOL", "TENTACRUEL", "GEODUDE", "GRAVELER", "GOLEM", "PONYTA", "RAPIDASH", "SLOWPOKE", "SLOWBRO", "MAGNEMITE", "MAGNETON", "FARFETCH_D", "DODUO", "DODRIO", "SEEL", "DEWGONG", "GRIMER", "MUK", "SHELLDER", "CLOYSTER", "GASTLY", "HAUNTER", "GENGAR", "ONIX", "DROWZEE", "HYPNO", "KRABBY", "KINGLER", "VOLTORB", "ELECTRODE", "EXEGGCUTE", "EXEGGUTOR", "CUBONE", "MAROWAK", "HITMONLEE", "HITMONCHAN", "LICKITUNG", "KOFFING", "WEEZING", "RHYHORN", "RHYDON", "CHANSEY", "TANGELA", "KANGASKHAN", "HORSEA", "SEADRA", "GOLDEEN", "SEAKING", "STARYU", "STARMIE", "MR_MIME", "SCYTHER", "JYNX", "ELECTABUZZ", "MAGMAR", "PINSIR", "TAUROS", "MAGIKARP", "GYARADOS", "LAPRAS", "DITTO", "EEVEE", "VAPOREON", "JOLTEON", "FLAREON", "PORYGON", "OMANYTE", "OMASTAR", "KABUTO", "KABUTOPS", "AERODACTYL", "SNORLAX", "ARTICUNO", "ZAPDOS", "MOLTRES", "DRATINI", "DRAGONAIR", "DRAGONITE", "MEWTWO", "MEW"]

moves = [["POUND", 0x01], ["KARATE_CHOP", 0x02], ["DOUBLESLAP", 0x03], ["COMET_PUNCH", 0x04], ["MEGA_PUNCH", 0x05], ["PAY_DAY", 0x06], ["FIRE_PUNCH", 0x07], ["ICE_PUNCH", 0x08], ["THUNDERPUNCH", 0x09], ["SCRATCH", 0x0A], ["VICEGRIP", 0x0B], ["GUILLOTINE", 0x0C], ["RAZOR_WIND", 0x0D], ["SWORDS_DANCE", 0x0E], ["CUT", 0x0F], ["GUST", 0x10], ["WING_ATTACK", 0x11], ["WHIRLWIND", 0x12], ["FLY", 0x13], ["BIND", 0x14], ["SLAM", 0x15], ["VINE_WHIP", 0x16], ["STOMP", 0x17], ["DOUBLE_KICK", 0x18], ["MEGA_KICK", 0x19], ["JUMP_KICK", 0x1A], ["ROLLING_KICK", 0x1B], ["SAND_ATTACK", 0x1C], ["HEADBUTT", 0x1D], ["HORN_ATTACK", 0x1E], ["FURY_ATTACK", 0x1F], ["HORN_DRILL", 0x20], ["TACKLE", 0x21], ["BODY_SLAM", 0x22], ["WRAP", 0x23], ["TAKE_DOWN", 0x24], ["THRASH", 0x25], ["DOUBLE_EDGE", 0x26], ["TAIL_WHIP", 0x27], ["POISON_STING", 0x28], ["TWINEEDLE", 0x29], ["PIN_MISSILE", 0x2A], ["LEER", 0x2B], ["BITE", 0x2C], ["GROWL", 0x2D], ["ROAR", 0x2E], ["SING", 0x2F], ["SUPERSONIC", 0x30], ["SONICBOOM", 0x31], ["DISABLE", 0x32], ["ACID", 0x33], ["EMBER", 0x34], ["FLAMETHROWER", 0x35], ["MIST", 0x36], ["WATER_GUN", 0x37], ["HYDRO_PUMP", 0x38], ["SURF", 0x39], ["ICE_BEAM", 0x3A], ["BLIZZARD", 0x3B], ["PSYBEAM", 0x3C], ["BUBBLEBEAM", 0x3D], ["AURORA_BEAM", 0x3E], ["HYPER_BEAM", 0x3F], ["PECK", 0x40], ["DRILL_PECK", 0x41], ["SUBMISSION", 0x42], ["LOW_KICK", 0x43], ["COUNTER", 0x44], ["SEISMIC_TOSS", 0x45], ["STRENGTH", 0x46], ["ABSORB", 0x47], ["MEGA_DRAIN", 0x48], ["LEECH_SEED", 0x49], ["GROWTH", 0x4A], ["RAZOR_LEAF", 0x4B], ["SOLARBEAM", 0x4C], ["POISONPOWDER", 0x4D], ["STUN_SPORE", 0x4E], ["SLEEP_POWDER", 0x4F], ["PETAL_DANCE", 0x50], ["STRING_SHOT", 0x51], ["DRAGON_RAGE", 0x52], ["FIRE_SPIN", 0x53], ["THUNDERSHOCK", 0x54], ["THUNDERBOLT", 0x55], ["THUNDER_WAVE", 0x56], ["THUNDER", 0x57], ["ROCK_THROW", 0x58], ["EARTHQUAKE", 0x59], ["FISSURE", 0x5A], ["DIG", 0x5B], ["TOXIC", 0x5C], ["CONFUSION", 0x5D], ["PSYCHIC_M", 0x5E], ["HYPNOSIS", 0x5F], ["MEDITATE", 0x60], ["AGILITY", 0x61], ["QUICK_ATTACK", 0x62], ["RAGE", 0x63], ["TELEPORT", 0x64], ["NIGHT_SHADE", 0x65], ["MIMIC", 0x66], ["SCREECH", 0x67], ["DOUBLE_TEAM", 0x68], ["RECOVER", 0x69], ["HARDEN", 0x6A], ["MINIMIZE", 0x6B], ["SMOKESCREEN", 0x6C], ["CONFUSE_RAY", 0x6D], ["WITHDRAW", 0x6E], ["DEFENSE_CURL", 0x6F], ["BARRIER", 0x70], ["LIGHT_SCREEN", 0x71], ["HAZE", 0x72], ["REFLECT", 0x73], ["FOCUS_ENERGY", 0x74], ["BIDE", 0x75], ["METRONOME", 0x76], ["MIRROR_MOVE", 0x77], ["SELFDESTRUCT", 0x78], ["EGG_BOMB", 0x79], ["LICK", 0x7A], ["SMOG", 0x7B], ["SLUDGE", 0x7C], ["BONE_CLUB", 0x7D], ["FIRE_BLAST", 0x7E], ["WATERFALL", 0x7F], ["CLAMP", 0x80], ["SWIFT", 0x81], ["SKULL_BASH", 0x82], ["SPIKE_CANNON", 0x83], ["CONSTRICT", 0x84], ["AMNESIA", 0x85], ["KINESIS", 0x86], ["SOFTBOILED", 0x87], ["HI_JUMP_KICK", 0x88], ["GLARE", 0x89], ["DREAM_EATER", 0x8A], ["POISON_GAS", 0x8B], ["BARRAGE", 0x8C], ["LEECH_LIFE", 0x8D], ["LOVELY_KISS", 0x8E], ["SKY_ATTACK", 0x8F], ["TRANSFORM", 0x90], ["BUBBLE", 0x91], ["DIZZY_PUNCH", 0x92], ["SPORE", 0x93], ["FLASH", 0x94], ["PSYWAVE", 0x95], ["SPLASH", 0x96], ["ACID_ARMOR", 0x97], ["CRABHAMMER", 0x98], ["EXPLOSION", 0x99], ["FURY_SWIPES", 0x9A], ["BONEMERANG", 0x9B], ["REST", 0x9C], ["ROCK_SLIDE", 0x9D], ["HYPER_FANG", 0x9E], ["SHARPEN", 0x9F], ["CONVERSION", 0xA0], ["TRI_ATTACK", 0xA1], ["SUPER_FANG", 0xA2], ["SLASH", 0xA3], ["SUBSTITUTE", 0xA4], ["STRUGGLE", 0xA5]]

elemental_types = [
["NORMAL", "EQU", 0x00],
["FIGHTING", "EQU", 0x01],
["FLYING", "EQU", 0x02],
["POISON", "EQU", 0x03],
["GROUND", "EQU", 0x04],
["ROCK", "EQU", 0x05],
["BUG", "EQU", 0x07],
["GHOST", "EQU", 0x08],
["FIRE", "EQU", 0x14],
["WATER", "EQU", 0x15],
["GRASS", "EQU", 0x16],
["ELECTRIC", "EQU", 0x17],
["PSYCHIC", "EQU", 0x18],
["ICE", "EQU", 0x19],
["DRAGON", "EQU", 0x1A]]

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

def get_mon_name(id):
    return pokemons[id]

def get_type_label(id):
    for line in elemental_types:
        if line[2] == id: return line[0]
    return None

def get_attack_label(id):
    for move in moves:
        if move[1] == id: return move[0]
    return "0" #no move

def get_pointer_target_at(address):
    rom = extract_maps.rom
    byte1 = ord(rom[address])
    byte2 = ord(rom[address+1])
    pointer = (byte1 + (byte2 << 8))
    return pointer

def get_frontsprite_label(id):
    return get_mon_name(id).title() + "PicFront"
def get_backsprite_label(id):
    return get_mon_name(id).title() + "PicBack"

def base_data_pretty_printer(id):
    """returns beautified asm for this pokemon

    uses 28 bytes

    pokedex number, base hp, base attack, base defense, base speed, base special
    type 1 (label), type 2 (label), catch rate, base experience yield
    dimensions of frontsprite (byte)
    frontsprite label pointer
    backsprite label pointer
    attacks known at level 1 (4 bytes, 4 constants)
    growth rate (byte)
    incbin - tm/hm flags (7 bytes)
    padding (0)
    """
    output = ""
    rom = extract_maps.rom
    base_address = 0x383de + (28 * (id))
    
    pokedex_number = id
    mon_name = get_mon_name(id)
    base_hp = ord(rom[base_address + 1])
    base_attack = ord(rom[base_address + 2])
    base_defense = ord(rom[base_address + 3])
    base_speed = ord(rom[base_address + 4])
    base_special = ord(rom[base_address + 5])
    
    type1_id = ord(rom[base_address + 6])
    type2_id = ord(rom[base_address + 7])
    type1 = get_type_label(type1_id)
    type2 = get_type_label(type2_id)

    catch_rate = ord(rom[base_address + 8])
    base_exp_yield = ord(rom[base_address + 9])
    frontsprite_dimensions = ord(rom[base_address + 10])

    frontsprite = get_frontsprite_label(id)
    backsprite = get_backsprite_label(id)

    #attacks known at level 0
    attack1 = get_attack_label(ord(rom[base_address + 15]))
    attack2 = get_attack_label(ord(rom[base_address + 16]))
    attack3 = get_attack_label(ord(rom[base_address + 17]))
    attack4 = get_attack_label(ord(rom[base_address + 18]))

    growth_rate = ord(rom[base_address + 19])

    incbin_start_address = base_address + 20
    incbin_end_address = base_address + 27

    output = mon_name.title() + ("BaseStats: ; 0x%.x" % (base_address)) + "\n"
    output += spacing + "db DEX_" + mon_name.upper() + " ; pokedex id\n"
    output += spacing + ("db " + str(base_hp)) + " ; base hp\n"
    output += spacing + "db " + str(base_attack) + " ; base attack\n"
    output += spacing + "db " + str(base_defense) + " ; base defense\n"
    output += spacing + "db " + str(base_speed) + " ; base speed\n"
    output += spacing + "db " + str(base_special) + " ; base special\n\n"
    output += spacing + "db " + type1 + " ; species type 1\n"
    output += spacing + "db " + type2 + " ; species type 2\n\n"
    output += spacing + "db " + str(catch_rate) + " ; catch rate\n"
    output += spacing + "db " + str(base_exp_yield) + " ; base exp yield\n"
    output += spacing + ("db $%.2x" % (frontsprite_dimensions)) + " ; sprite dimensions\n\n"
    output += spacing + "dw " + frontsprite + "\n"
    output += spacing + "dw " + backsprite + "\n"
    output += spacing + "\n" + spacing + "; attacks known at lvl 0\n"
    output += spacing + "db " + attack1 + "\n"
    output += spacing + "db " + attack2 + "\n"
    output += spacing + "db " + attack3 + "\n"
    output += spacing + "db " + attack4 + "\n\n"
    output += spacing + "db " + str(growth_rate) + " ; growth rate\n"
    output += spacing + "\n" + spacing + "; learnset\n"
    
    #learnset crap
    output += spacing + "db %" + bin(ord(rom[base_address + 20]))[2:].zfill(8) + "\n"
    output += spacing + "db %" + bin(ord(rom[base_address + 21]))[2:].zfill(8) + "\n"
    output += spacing + "db %" + bin(ord(rom[base_address + 22]))[2:].zfill(8) + "\n"
    output += spacing + "db %" + bin(ord(rom[base_address + 23]))[2:].zfill(8) + "\n"
    output += spacing + "db %" + bin(ord(rom[base_address + 24]))[2:].zfill(8) + "\n"
    output += spacing + "db %" + bin(ord(rom[base_address + 25]))[2:].zfill(8) + "\n"
    output += spacing + "db %" + bin(ord(rom[base_address + 26]))[2:].zfill(8) + "\n\n"

    output += spacing + "db 0 ; padding\n"

    return output

def insert_base_stats(id):
    insert_asm = base_data_pretty_printer(id)

    address = 0x383de + (28 * (id))
    line_number = find_incbin_to_replace_for(address)
    label = get_mon_name(id).title() + "BaseStats"
    if line_number == None:
        print "skipping, already inserted at " + hex(address)
        return

    #also do a name check
    if (label + ":") in "\n".join(analyze_incbins.asm):
        print "skipping " + label + " because it is already in use.."
        return
    
    newlines = split_incbin_line_into_three(line_number, address, 28 )

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
    print diff
    apply_diff(diff, try_fixing=False, do_compile=False)

def insert_all_base_stats():
    for id in range(0, 151):
        #if id < 62: continue #skip
        insert_base_stats(id)
        
        #reset everything
        reset_incbins()
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

if __name__ == "__main__":
    #load map headers and object data
    extract_maps.load_rom()
    extract_maps.load_map_pointers()
    extract_maps.read_all_map_headers()
    load_labels()
    #print base_data_pretty_printer(0)
    load_asm()
    isolate_incbins()
    process_incbins()
    #insert_base_stats(1)
    insert_all_base_stats()

    #load texts (these two have different formats)
    #all_texts = pretty_map_headers.analyze_texts.analyze_texts()
    #pretty_map_headers.all_texts = all_texts
    #tx_fars = pretty_map_headers.find_all_tx_fars()

    #load incbins
    #reset_incbins()

    #scan_for_map_scripts_pointer()
    #scan_rom_for_tx_fars_and_insert()
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

