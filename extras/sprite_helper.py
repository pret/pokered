from extract_maps import *
spacing = "	"
load_rom()
load_map_pointers()
read_all_map_headers()

#provided by sawakita
constants = {
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
        if icon_id in constants.keys():
            possible_name = " (sawakita suggests: " + constants[icon_id][0] + ")"
    
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
        if icon not in constants:
            todo_sprites[icon] = counter
            constants[icon] = None
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

    for sprite_id in constants:
        suggestions = constants[sprite_id]
        if suggestions == None:
            sprites[sprite_id] = "SPRITE_TODO_" + str(todo_sprites[sprite_id])
            continue #next please

        original = suggestions[0]
        if suggestions[1] != "": original = suggestions[1]
        
        result = sprite_name_cleaner(original)
        sprites[sprite_id] = result

def sprite_printer():
    for key in sprites:
        line_length = len(sprites[key]) + len(" EQU $") + 2
        
        if line_length < 40:
            extra = (40 - line_length) * " "
        else: extra = ""

        value = hex(key)[2:]
        if len(value) == 1: value = "0" + value
        
        print sprites[key] + extra + " EQU $" + value

sprite_namer()
if __name__ == "__main__":
    #load_icons()
    #print_appearances()
    sprite_printer()

