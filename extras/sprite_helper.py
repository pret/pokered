import extract_maps
spacing = "\t"

#provided by sawakita
#these were originally used for making the initial_icon_constants
#but the label names in constants.asm have since been edited
initial_icon_constants = {
0x01: ["Hiro", ""],
0x02: ["Rival", ""],
0x03: ["Oak", ""],
0x04: ["blonde boy", ""],
0x05: ["machoke/slowbro OW", "machoke slowbro"],
0x06: ["blonde(horse-tail-hair) girl", "blonde ponytail girl"],
0x07: ["black-hair boy 1", "black hair boy 1"],
0x08: ["little kid (F)", "little girl"],
0x09: ["bird", ""],
0x0A: ["fat bald man", "fat bald guy"],
0x0B: ["monk", ""],
0x0C: ["black-hair boy 2/Brock", "black hair boy 2"],
0x0D: ["girl", ""],
0x0E: ["hiker/angry man", "hiker"],
0x0F: ["foulard woman", "foulard woman"],
0x10: ["rich(black-hat) man", "gentleman"],
0x11: ["sister", ""],
0x12: ["motorbiker", "biker"],
0x13: ["sailor", ""],
0x14: ["cook", ""],
0x15: ["sun-glasses guy (bike seller)", "sunglasses guy"],
0x16: ["mr. fuji", ""],
0x17: ["giovanni", ""],
0x18: ["rocket guy", "rocket grunt"],
0x19: ["medium", ""],
0x1A: ["waiter", ""],
0x1B: ["erika", ""],
0x1C: ["mother (geisha)", "mom geisha"],
0x1D: ["brunette girl", ""],
0x1E: ["lance", ""],
0x1F: ["oak's aide/scientist", "oak scientist aide"],
0x20: ["oak's aide", "oak aide"],
0x21: ["punk", ""],
0x22: ["swimmer", ""],
0x23: ["white player", ""],
0x24: ["gym helper", ""],
0x25: ["old (wo)man", "old person"],
0x26: ["mart guy", ""],
0x27: ["fisher", ""],
0x28: ["old woman/medium?", "old medium woman"],
0x29: ["nurse", ""],
0x2A: ["cable-club woman", "cable club woman"],
0x2B: ["Mr. Masterball?", "mr masterball"],
0x2C: ["person that gives Lapras", "lapras giver"],
0x2D: ["semi-bald fat guy", "balding fat guy"],
0x2E: ["black hat white beard man ", ""],
0x2F: ["fat man", ""],
0x30: ["dojo guy", ""],
0x31: ["guard (cop?)", "guard cop"],
0x32: ["cop (guard)", "cop guard"],
0x33: ["mom", ""],
0x34: ["semi-bald man", "balding guy"],
0x35: ["young girl", ""],
0x36: ["gameboy kid", ""],
0x37: ["gameboy kid copy", ""],
0x38: ["clefairy-like", "clefairylike"],
0x39: ["Agatha", ""],
0x3A: ["Bruno", ""],
0x3B: ["Lorelei", ""],
0x3C: ["seel", ""],
0x3D: ["ball", ""],
0x3E: ["omanyte", ""],
0x3F: ["boulder", ""],
0x40: ["paper sheet", ""],
0x41: ["book/map/dex", ""],
0x42: ["clipboard", ""],
0x43: ["snorlax", ""],
0x44: ["old amber copy", ""],
0x45: ["old amber", ""],
0x46: ["lying old man unused 1", ""],
0x47: ["lying old man unused 2", ""],
0x48: ["lying old man", ""],
}

#somewhat more recent sprite labels
sprite_constants = {
0x01: "SPRITE_RED",
0x02: "SPRITE_BLUE",
0x03: "SPRITE_OAK",
0x04: "SPRITE_BUG_CATCHER",
0x05: "SPRITE_SLOWBRO",
0x06: "SPRITE_LASS",
0x07: "SPRITE_BLACK_HAIR_BOY_1",
0x08: "SPRITE_LITTLE_GIRL",
0x09: "SPRITE_BIRD",
0x0a: "SPRITE_FAT_BALD_GUY",
0x0b: "SPRITE_GAMBLER",
0x0c: "SPRITE_BLACK_HAIR_BOY_2",
0x0d: "SPRITE_GIRL",
0x0e: "SPRITE_HIKER",
0x0f: "SPRITE_FOULARD_WOMAN",
0x10: "SPRITE_GENTLEMAN",
0x11: "SPRITE_DAISY",
0x12: "SPRITE_BIKER",
0x13: "SPRITE_SAILOR",
0x14: "SPRITE_COOK",
0x15: "SPRITE_BIKE_SHOP_GUY",
0x16: "SPRITE_MR_FUJI",
0x17: "SPRITE_GIOVANNI",
0x18: "SPRITE_ROCKET",
0x19: "SPRITE_MEDIUM",
0x1a: "SPRITE_WAITER",
0x1b: "SPRITE_ERIKA",
0x1c: "SPRITE_MOM_GEISHA",
0x1d: "SPRITE_BRUNETTE_GIRL",
0x1e: "SPRITE_LANCE",
0x1f: "SPRITE_OAK_SCIENTIST_AIDE",
0x20: "SPRITE_OAK_AIDE",
0x21: "SPRITE_ROCKER",
0x22: "SPRITE_SWIMMER",
0x23: "SPRITE_WHITE_PLAYER",
0x24: "SPRITE_GYM_HELPER",
0x25: "SPRITE_OLD_PERSON",
0x26: "SPRITE_MART_GUY",
0x27: "SPRITE_FISHER",
0x28: "SPRITE_OLD_MEDIUM_WOMAN",
0x29: "SPRITE_NURSE",
0x2a: "SPRITE_CABLE_CLUB_WOMAN",
0x2b: "SPRITE_MR_MASTERBALL",
0x2c: "SPRITE_LAPRAS_GIVER",
0x2d: "SPRITE_WARDEN",
0x2e: "SPRITE_SS_CAPTAIN",
0x2f: "SPRITE_FISHER2",
0x30: "SPRITE_BLACKBELT",
0x31: "SPRITE_GUARD",
0x32: "SPRITE_____NOT____USED____",
0x33: "SPRITE_MOM",
0x34: "SPRITE_BALDING_GUY",
0x35: "SPRITE_YOUNG_BOY",
0x36: "SPRITE_GAMEBOY_KID",
0x37: "SPRITE_GAMEBOY_KID_COPY",
0x38: "SPRITE_CLEFAIRY",
0x39: "SPRITE_AGATHA",
0x3a: "SPRITE_BRUNO",
0x3b: "SPRITE_LORELEI",
0x3c: "SPRITE_SEEL",
0x3d: "SPRITE_BALL",
0x3e: "SPRITE_OMANYTE",
0x3f: "SPRITE_BOULDER",
0x40: "SPRITE_PAPER_SHEET",
0x41: "SPRITE_BOOK_MAP_DEX",
0x42: "SPRITE_CLIPBOARD",
0x43: "SPRITE_SNORLAX",
0x44: "SPRITE_OLD_AMBER_COPY",
0x45: "SPRITE_OLD_AMBER",
0x46: "SPRITE_LYING_OLD_MAN_UNUSED_1",
0x47: "SPRITE_LYING_OLD_MAN_UNUSED_2",
0x48: "SPRITE_LYING_OLD_MAN",
}
dont_use = [0x32, 0x44, 0x46, 0x47, 0x37]
#sprites after 0x23 have only one image
#SPRITE_BIKE_SHOP_GUY only has 1

icons = {}
unique_icons = set()
todo_sprites = {}
sprites = {}

def load_icons():
    for map_id in map_headers:
        if map_id in [0x0b, 0x45, 0x4b, 0x4e, 0x69, 0x6a, 0x6b, 0x6d, 0x6e, 0x6f, 0x70, 0x72, 0x73, 0x74, 0x75, 0xad, 0xcc, 0xcd, 0xce, 0xe7, 0xed, 0xee, 0xf1, 0xf2, 0xf3, 0xf4]: continue #skip
        map = map_headers[map_id]
        for thing_id in map["object_data"]["things"]:
            thing = map["object_data"]["things"][thing_id]
            pic = thing["picture_number"]
            unique_icons.add(pic)
    
            if not icons.has_key(pic): icons[pic] = []
            
            alerter = None
            if int(thing["y"])-4 > int(map["y"], 16)*2: alerter = True
            if int(thing["x"])-4 > int(map["x"], 16)*2: alerter = True

            icons[pic].append((map["name"] + " (id=" + str(map["id"]) + ")", thing["y"], thing["x"], alerter))

def print_appearances():
    """print appearances of each icon
    see: http://diyhpl.us/~bryan/irc/pokered/sprite_appearances.txt
    """
    output = ""
    for icon_id in icons:
        icon = icons[icon_id]
        
        possible_name = ""
        if icon_id in initial_icon_constants.keys():
            possible_name = " (sawakita suggests: " + initial_icon_constants[icon_id][0] + ")"
    
        output += "sprite " + hex(icon_id) + possible_name + ":\n"
        for appearance in icon:
            if appearance[3] != None: outside_alert = " !! OUTSIDE BOUNDS"
            else: outside_alert = ""
            output += spacing + ".. in " + appearance[0] + " at (" + str(appearance[1]) + ", " + str(appearance[2]) + ")" + outside_alert + "\n"
        output += "\n"
    
    print output

def insert_todo_sprites():
    load_icons()
    counter = 1
    for icon in unique_icons:
        if icon not in initial_icon_constants:
            todo_sprites[icon] = counter
            initial_icon_constants[icon] = None
            counter += 1

def sprite_name_cleaner(badname):
    output = "SPRITE_" + badname
    output = output.replace(" ", "_")
    output = output.replace("/", "_")
    output = output.replace(".", "")

    output = output.upper()

    while output[-1] == "_":
        output = output[:-1]
    return output

def sprite_namer():
    "makes up better constant names for each sprite"
    insert_todo_sprites()

    for sprite_id in initial_icon_constants:
        suggestions = initial_icon_constants[sprite_id]
        if suggestions == None:
            sprites[sprite_id] = "SPRITE_TODO_" + str(todo_sprites[sprite_id])
            continue #next please

        original = suggestions[0]
        if suggestions[1] != "": original = suggestions[1]
        
        result = sprite_name_cleaner(original)
        sprites[sprite_id] = result

def sprite_printer():
    """prints out a list of sprite constants to put into constants.asm
    it's deprecated- use the names from the current file instead."""
    for key in sprites:
        line_length = len(sprites[key]) + len(" EQU $") + 2
        
        if line_length < 40:
            extra = (40 - line_length) * " "
        else: extra = ""

        value = hex(key)[2:]
        if len(value) == 1: value = "0" + value
        
        print sprites[key] + extra + " EQU $" + value

def parse_sprite_sheet_pointer_table():
    """parses the bytes making up the pointer table
    first two bytes are the pointer
    third byte is the number of bytes (1 * 4 tiles * 16 bytes each, or 3 * 4 tiles * 16 bytes per tile)
        1 = 1 pose
        3 = 3 poses, possibly 6 immediately after
        $C0 or $40
    fourth byte is the rom bank
    
    so a quick estimation is that, if it has 3, and there's no other pointer that points to the one after the 3rd & next 3, then assume those next 3 are the 4th, 5th and 6th
    """
    rom = extract_maps.rom
    ptable_address = 0x17b27 #5:7b27
    ptable_pointers = []
    ptable_sheet_data = {}

    #load up pointers please
    for sprite_id in sprite_constants.keys():
        pointer_offset = 0x17b27 + ((sprite_id -1) * 4)
        pointer_byte1 = ord(rom[pointer_offset])
        pointer_byte2 = ord(rom[pointer_offset+1])
        partial_pointer = (pointer_byte1 + (pointer_byte2 << 8))
        bank = ord(rom[pointer_offset+3])
        pointer = extract_maps.calculate_pointer(partial_pointer, bank)
        ptable_pointers.append(pointer)

    #72 sprite pointers, we're not using id=$32
    for sprite_id in sprite_constants.keys():
        sprite_name = sprite_constants[sprite_id]

        #some basic information about this sprite first
        data_entry = {"sprite_id": sprite_id, "sprite_name": sprite_name}

        #calculate where it is in the 0x17b27 pointer table
        pointer_offset = 0x17b27 + ((sprite_id -1) * 4)
        data_entry["sprite_ptr_table_entry_address"] = pointer_offset

        #actual sprite pointer
        pointer_byte1 = ord(rom[pointer_offset])
        pointer_byte2 = ord(rom[pointer_offset+1])
        partial_pointer = (pointer_byte1 + (pointer_byte2 << 8))
        bank = ord(rom[pointer_offset+3])
        pointer = extract_maps.calculate_pointer(partial_pointer, bank)
        data_entry["pointer"] = pointer
        data_entry["bank"] = bank

        byte_count = ord(rom[pointer_offset+2])
        data_entry["byte_count"] = byte_count

        has_more_text = ""
        data_entry["poses"] = 1
        if byte_count == 0xc0: #has at least 3 poses
            setter1, setter2, setter3 = False, False, False
            data_entry["poses"] = 3
            #let's check if there's possibly more
            if not ((byte_count + pointer) in ptable_pointers): #yep, probably (#4)
                data_entry["poses"] += 1
                data_entry["byte_count"] += 64
                setter1 = True
            if setter1 and not ((byte_count + pointer + 64) in ptable_pointers): #has another (#5)
                data_entry["poses"] += 1
                data_entry["byte_count"] += 64
                setter2 = True
            if setter2 and not ((byte_count + pointer + 64 + 64) in ptable_pointers): #has a #6
                data_entry["poses"] += 1
                data_entry["byte_count"] += 64
                setter3 = True

        print ("$%.2x " % (sprite_id)) + sprite_name + " has $%.2x bytes" % (byte_count) + " pointing to 0x%.x" % (pointer) + " bank is $%.2x" % (bank) + " with pose_count=" + str(data_entry["poses"])

        ptable_sheet_data[sprite_id] = data_entry
    return ptable_sheet_data

def pretty_print_sheet_incbins(ptable_sheet_data):
    """make things look less awful"""
    output = ""
    used_addresses = []

    for sheet_id in ptable_sheet_data:
        sheet_data = ptable_sheet_data[sheet_id]
        name = sheet_data["sprite_name"].split("SPRITE_")[1].lower().title()
        clean_name = name.replace("_", "")
        address = sheet_data["pointer"]
        byte_count = sheet_data["byte_count"]

        #if not (0x10000 <= address <= 0x12e7f): continue #skip
        #if not (0x14180 <= address <= 0x17840): continue #skip
        if address in used_addresses: continue #skip
        used_addresses.append(address)

        output += clean_name + "Sprite: ; 0x%.x" % (address) + "\n"
        #output += spacing + "INCBIN \"baserom.gbc\",$%.x,$%.x - $%.x" % (address, address + byte_count, address) + "\n"
        output += spacing + "INCBIN \"gfx/sprites/" + name.lower() + ".2bpp\" ; was $%.x" % (address) + "\n"

        filename = "../gfx/sprites/" + name.lower() + ".2bpp"
        #fh = open(filename, "w")
        #fh.write(extract_maps.rom[address : address + byte_count])
        #fh.close()

    return output

def pretty_print_sheet_data(ptable_sheet_data):
    """make the pointer table not suck so much"""
    output = "SpriteSheetPointerTable: ; 0x17b27\n"
    used_addresses = []

    for sheet_id in ptable_sheet_data:
        sheet_data = ptable_sheet_data[sheet_id]
        address = sheet_data["pointer"]
        checker = False
        for x in used_addresses:
            if not checker and x[0] == address:
                checker = True
                clean_name = x[1]

        if not checker:
            name = sheet_data["sprite_name"].split("SPRITE_")[1].lower().title()
            clean_name = name.replace("_", "")
            clean_name += "Sprite"

        byte_count = sheet_data["byte_count"]
        if byte_count > 0x40:
            byte_count = 0xc0

        output += "\n\t; " + sprite_constants[sheet_data["sprite_id"]] + "\n"
        output += spacing + "dw " + clean_name + "\n"
        output += spacing + "db $%.2x ; byte count\n" % (byte_count)
        output += spacing + "db BANK(" + clean_name + ")\n"

        used_addresses.append((address, clean_name))

    output += "; 0x17c47"
    return output

if __name__ == "__main__":
    extract_maps.load_rom()
    #extract_maps.load_map_pointers()
    #extract_maps.read_all_map_headers()

    #sprite_namer()
    #load_icons()
    #print_appearances()
    #sprite_printer()
    
    ptable_sheet_data = parse_sprite_sheet_pointer_table()
    print pretty_print_sheet_incbins(ptable_sheet_data)
    print pretty_print_sheet_data(ptable_sheet_data)
