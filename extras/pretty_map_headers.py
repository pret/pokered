# -*- coding: utf-8 -*-
#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-02
#purpose: dump asm for each map header
import json
import extract_maps
import sprite_helper
import random
import string
import analyze_texts #hopefully not a dependency loop

base = 16
spacing = "	"
all_texts = None

#map constants
map_constants = [
["PALLET_TOWN", 0x00],
["VIRIDIAN_CITY", 0x01],
["PEWTER_CITY", 0x02],
["CERULEAN_CITY", 0x03],
["LAVENDER_TOWN", 0x04],
["VERMILION_CITY", 0x05],
["CELADON_CITY", 0x06],
["FUCHSIA_CITY", 0x07],
["CINNABAR_ISLAND", 0x08],
["INDIGO_PLATEAU", 0x09],
["SAFFRON_CITY", 0x0A],
["ROUTE_1", 0x0C],
["ROUTE_2", 0x0D],
["ROUTE_3", 0x0E],
["ROUTE_4", 0x0F],
["ROUTE_5", 0x10],
["ROUTE_6", 0x11],
["ROUTE_7", 0x12],
["ROUTE_8", 0x13],
["ROUTE_9", 0x14],
["ROUTE_10", 0x15],
["ROUTE_11", 0x16],
["ROUTE_12", 0x17],
["ROUTE_13", 0x18],
["ROUTE_14", 0x19],
["ROUTE_15", 0x1A],
["ROUTE_16", 0x1B],
["ROUTE_17", 0x1C],
["ROUTE_18", 0x1D],
["ROUTE_19", 0x1E],
["ROUTE_20", 0x1F],
["ROUTE_21", 0x20],
["ROUTE_22", 0x21],
["ROUTE_23", 0x22],
["ROUTE_24", 0x23],
["ROUTE_25", 0x24],
["REDS_HOUSE_1F", 0x25],
["REDS_HOUSE_2F", 0x26],
["BLUES_HOUSE", 0x27],
["OAKS_LAB", 0x28],
["VIRIDIAN_POKECENTER", 0x29],
["VIRIDIAN_MART", 0x2A],
["VIRIDIAN_SCHOOL", 0x2B],
["VIRIDIAN_HOUSE", 0x2C],
["VIRIDIAN_GYM", 0x2D],
["DIGLETTS_CAVE_EXIT", 0x2E],
["VIRIDIAN_FOREST_EXIT", 0x2F],
["ROUTE_2_HOUSE", 0x30],
["ROUTE_2_GATE", 0x31],
["VIRIDIAN_FOREST_ENTRANCE", 0x32],
["VIRIDIAN_FOREST", 0x33],
["MUSEUM_1F", 0x34],
["MUSEUM_2F", 0x35],
["PEWTER_GYM", 0x36],
["PEWTER_HOUSE_1", 0x37],
["PEWTER_MART", 0x38],
["PEWTER_HOUSE_2", 0x39],
["PEWTER_POKECENTER", 0x3A],
["MT_MOON_1", 0x3B],
["MT_MOON_2", 0x3C],
["MT_MOON_3", 0x3D],
["TRASHED_HOUSE", 0x3E],
["CERULEAN_HOUSE", 0x3F],
["CERULEAN_POKECENTER", 0x40],
["CERULEAN_GYM", 0x41],
["BIKE_SHOP", 0x42],
["CERULEAN_MART", 0x43],
["MT_MOON_POKECENTER", 0x44],
["ROUTE_5_GATE", 0x46],
["PATH_ENTRANCE_ROUTE_5", 0x47],
["DAYCAREM", 0x48],
["ROUTE_6_GATE", 0x49],
["PATH_ENTRANCE_ROUTE_6", 0x4A],
["ROUTE_7_GATE", 0x4C],
["PATH_ENTRANCE_ROUTE_7", 0x4D],
["ROUTE_8_GATE", 0x4F],
["PATH_ENTRANCE_ROUTE_8", 0x50],
["ROCK_TUNNEL_POKECENTER", 0x51],
["ROCK_TUNNEL_1", 0x52],
["POWER_PLANT", 0x53],
["ROUTE_11_GATE_1F", 0x54],
["DIGLETTS_CAVE_ENTRANCE", 0x55],
["ROUTE_11_GATE_2F", 0x56],
["ROUTE_12_GATE", 0x57],
["BILLS_HOUSE", 0x58],
["VERMILION_POKECENTER", 0x59],
["POKEMON_FAN_CLUB", 0x5A],
["VERMILION_MART", 0x5B],
["VERMILION_GYM", 0x5C],
["VERMILION_HOUSE_1", 0x5D],
["VERMILION_DOCK", 0x5E],
["SS_ANNE_1", 0x5F],
["SS_ANNE_2", 0x60],
["SS_ANNE_3", 0x61],
["SS_ANNE_4", 0x62],
["SS_ANNE_5", 0x63],
["SS_ANNE_6", 0x64],
["SS_ANNE_7", 0x65],
["SS_ANNE_8", 0x66],
["SS_ANNE_9", 0x67],
["SS_ANNE_10", 0x68],
["VICTORY_ROAD_1", 0x6C],
["LANCES_ROOM", 0x71],
["HALL_OF_FAME", 0x76],
["UNDERGROUND_PATH_NS", 0x77],
["CHAMPIONS_ROOM", 0x78],
["UNDERGROUND_PATH_WE", 0x79],
["CELADON_MART_1", 0x7A],
["CELADON_MART_2", 0x7B],
["CELADON_MART_3", 0x7C],
["CELADON_MART_4", 0x7D],
["CELADON_MART_5", 0x7E],
["CELADON_MART_6", 0x7F],
["CELADON_MANSION_1", 0x80],
["CELADON_MANSION_2", 0x81],
["CELADON_MANSION_3", 0x82],
["CELADON_MANSION_4", 0x83],
["CELADON_MANSION_5", 0x84],
["CELADON_POKECENTER", 0x85],
["CELADON_GYM", 0x86],
["GAME_CORNER", 0x87],
["CELADON_HOUSE", 0x88],
["CELADONPRIZE_ROOM", 0x89],
["CELADON_DINER", 0x8A],
["CELADON_HOUSE_2", 0x8B],
["CELADONHOTEL", 0x8C],
["LAVENDER_POKECENTER", 0x8D],
["POKEMONTOWER_1", 0x8E],
["POKEMONTOWER_2", 0x8F],
["POKEMONTOWER_3", 0x90],
["POKEMONTOWER_4", 0x91],
["POKEMONTOWER_5", 0x92],
["POKEMONTOWER_6", 0x93],
["POKEMONTOWER_7", 0x94],
["LAVENDER_HOUSE_1", 0x95],
["LAVENDER_MART", 0x96],
["LAVENDER_HOUSE_2", 0x97],
["FUCHSIA_MART", 0x98],
["FUCHSIA_HOUSE_1", 0x99],
["FUCHSIA_POKECENTER", 0x9A],
["FUCHSIA_HOUSE_2", 0x9B],
["SAFARIZONEENTRANCE", 0x9C],
["FUCHSIA_GYM", 0x9D],
["FUCHSIAMEETINGROOM", 0x9E],
["SEAFOAM_ISLANDS_2", 0x9F],
["SEAFOAM_ISLANDS_3", 0xA0],
["SEAFOAM_ISLANDS_4", 0xA1],
["SEAFOAM_ISLANDS_5", 0xA2],
["VERMILION_HOUSE_2", 0xA3],
["FUCHSIA_HOUSE_3", 0xA4],
["MANSION_1", 0xA5],
["CINNABAR_GYM", 0xA6],
["CINNABAR_LAB_1", 0xA7],
["CINNABAR_LAB_2", 0xA8],
["CINNABAR_LAB_3", 0xA9],
["CINNABAR_LAB_4", 0xAA],
["CINNABAR_POKECENTER", 0xAB],
["CINNABAR_MART", 0xAC],
["INDIGO_PLATEAU_LOBBY", 0xAE],
["COPYCATS_HOUSE_1F", 0xAF],
["COPYCATS_HOUSE_2F", 0xB0],
["FIGHTINGDOJO", 0xB1],
["SAFFRON_GYM", 0xB2],
["SAFFRON_HOUSE_1", 0xB3],
["SAFFRON_MART", 0xB4],
["SILPH_CO_1F", 0xB5],
["SAFFRON_POKECENTER", 0xB6],
["SAFFRON_HOUSE_2", 0xB7],
["ROUTE_15_GATE", 0xB8],
["ROUTE_16_GATE_1F", 0xBA],
["ROUTE_16_GATE_2F", 0xBB],
["ROUTE_16_HOUSE", 0xBC],
["ROUTE_12_HOUSE", 0xBD],
["ROUTE_18_GATE_1F", 0xBE],
["ROUTE_18_GATE_2F", 0xBF],
["SEAFOAM_ISLANDS_1", 0xC0],
["ROUTE_22_GATE", 0xC1],
["VICTORY_ROAD_2", 0xC2],
["ROUTE_12_GATE_2F", 0xC3],
["VERMILION_HOUSE_3", 0xC4],
["DIGLETTS_CAVE", 0xC5],
["VICTORY_ROAD_3", 0xC6],
["ROCKET_HIDEOUT_1", 0xC7],
["ROCKET_HIDEOUT_2", 0xC8],
["ROCKET_HIDEOUT_3", 0xC9],
["ROCKET_HIDEOUT_4", 0xCA],
["ROCKET_HIDEOUT_ELEVATOR", 0xCB],
["SILPH_CO_2F", 0xCF],
["SILPH_CO_3F", 0xD0],
["SILPH_CO_4F", 0xD1],
["SILPH_CO_5F", 0xD2],
["SILPH_CO_6F", 0xD3],
["SILPH_CO_7F", 0xD4],
["SILPH_CO_8F", 0xD5],
["MANSION_2", 0xD6],
["MANSION_3", 0xD7],
["MANSION_4", 0xD8],
["SAFARI_ZONE_EAST", 0xD9],
["SAFARI_ZONE_NORTH", 0xDA],
["SAFARI_ZONE_WEST", 0xDB],
["SAFARI_ZONE_CENTER", 0xDC],
["SAFARI_ZONE_REST_HOUSE_1", 0xDD],
["SAFARI_ZONE_SECRET_HOUSE", 0xDE],
["SAFARI_ZONE_REST_HOUSE_2", 0xDF],
["SAFARI_ZONE_REST_HOUSE_3", 0xE0],
["SAFARI_ZONE_REST_HOUSE_4", 0xE1],
["UNKNOWN_DUNGEON_2", 0xE2],
["UNKNOWN_DUNGEON_3", 0xE3],
["UNKNOWN_DUNGEON_1", 0xE4],
["NAME_RATERS_HOUSE", 0xE5],
["CERULEAN_HOUSE_3", 0xE6],
["ROCK_TUNNEL_2", 0xE8],
["SILPH_CO_9F", 0xE9],
["SILPH_CO_10F", 0xEA],
["SILPH_CO_11F", 0xEB],
["SILPH_CO_ELEVATOR", 0xEC],
["BATTLE_CENTER", 0xEF],
["TRADE_CENTER", 0xF0],
["LORELEIS_ROOM", 0xF5],
["BRUNOS_ROOM", 0xF6],
["AGATHAS_ROOM", 0xF7],
["BEACH_HOUSE", 0xF8]]

#i prefer a different data structure
temp = {}
for constant in map_constants:
    value = constant[1]
    name = constant[0]
    temp[value] = name
map_constants = temp
del temp

#these appear outside of quotes
constant_abbreviation_bytes = {
}

#these appear in quotes
char_conversion = [
(" ", 0x7F),
("A", 0x80),
("B", 0x81),
("C", 0x82),
("D", 0x83),
("E", 0x84),
("F", 0x85),
("G", 0x86),
("H", 0x87),
("I", 0x88),
("J", 0x89),
("K", 0x8A),
("L", 0x8B),
("M", 0x8C),
("N", 0x8D),
("O", 0x8E),
("P", 0x8F),
("Q", 0x90),
("R", 0x91),
("S", 0x92),
("T", 0x93),
("U", 0x94),
("V", 0x95),
("W", 0x96),
("X", 0x97),
("Y", 0x98),
("Z", 0x99),
("(", 0x9A),
(")", 0x9B),
(":", 0x9C),
(";", 0x9D),
("[", 0x9E),
("]", 0x9F),
("a", 0xA0),
("b", 0xA1),
("c", 0xA2),
("d", 0xA3),
("e", 0xA4),
("f", 0xA5),
("g", 0xA6),
("h", 0xA7),
("i", 0xA8),
("j", 0xA9),
("k", 0xAA),
("l", 0xAB),
("m", 0xAC),
("n", 0xAD),
("o", 0xAE),
("p", 0xAF),
("q", 0xB0),
("r", 0xB1),
("s", 0xB2),
("t", 0xB3),
("u", 0xB4),
("v", 0xB5),
("w", 0xB6),
("x", 0xB7),
("y", 0xB8),
("z", 0xB9),
("é", 0xBA),
("'d", 0xBB),
("'l", 0xBC),
("'s", 0xBD),
("'t", 0xBE),
("'v", 0xBF),
("'", 0xE0),
("-", 0xE3),
("'r", 0xE4),
("'m", 0xE5),
("?", 0xE6),
("!", 0xE7),
(".", 0xE8),
("♂", 0xEF),
#("¥", 0xF0),
("/", 0xF3),
(",", 0xF4),
("♀", 0xF5),
("0", 0xF6),
("1", 0xF7),
("2", 0xF8),
("3", 0xF9),
("4", 0xFA),
("5", 0xFB),
("6", 0xFC),
("7", 0xFD),
("8", 0xFE),
("9", 0xFF)]
#these appear in quotes
txt_bytes = {
    0x50: "@",
    0x54: "#",
    0x75: "…",
}
for item in char_conversion:
    txt_bytes[item[1]] = item[0]
del char_conversion

#this was originally for renaming freeze maps for a unique name
def random_hash():
    available_chars = string.hexdigits[:16]
    return ''.join(
        random.choice(available_chars)
        for dummy in xrange(5))

def offset_to_pointer(offset):
    if type(offset) == str: offset = int(offset, base)
    return int(offset) % 0x4000 + 0x4000

def map_name_cleaner(name, id):
    "names have to be acceptable asm labels"
    
    #duck out early
    if name == "FREEZE":
        #name += "_" + random_hash() + "_h"
        name += "_" + str(id) + "_h"
        return name

    #the long haul
    name = name.replace(":", "")
    name = name.replace("(", "")
    name = name.replace(")", "")
    name = name.replace("'", "")
    name = name.replace("/", "") #N/S -> NS, W/E -> WE
    name = name.replace(".", "") #S.S. -> SS, Mt. -> Mt
    name = name.replace(" ", "") #or '_' ??
    name = name + "_h"

    return name

def write_connections(north, south, west, east):
    #north 0, south 1, west 2, east 3
    if north and south and west and east: return "NORTH | SOUTH | WEST | EAST"
    if north and south and west and not east: return "NORTH | SOUTH | WEST"
    if north and south and not west and east: return "NORTH | SOUTH | EAST"
    if north and not south and west and east: return "NORTH | WEST | EAST"
    if not north and south and west and east: return "SOUTH | WEST | EAST"
    if north and south and not west and not east: return "NORTH | SOUTH"
    if not north and not south and west and east: return "WEST | EAST"
    if not north and south and west and not east: return "SOUTH | WEST"
    if not north and south and not west and east: return "SOUTH | EAST"
    if north and not south and west and not east: return "NORTH | WEST"
    if north and not south and not west and east: return "NORTH | EAST"
    raise Exception, "unpredicted outcome on write_connections"

#TODO: make this elegant
def connection_line(byte):
    if type(byte) == str:
        byte = int(byte, base)

    connections = 0
    north, south, west, east = False, False, False, False

    temp = bin(byte)[2:]

    if len(temp) == 1:
        if temp[0] == "1": #EAST
            east = True
    elif len(temp) == 2:
        if temp[0] == "1": #WEST
            west = True
        if temp[1] == "1": #EAST
            east = True
    elif len(temp) == 3:
        if temp[0] == "1": #SOUTH
            south = True
        if temp[1] == "1": #WEST
            west = True
        if temp[2] == "1": #EAST
            east = True
    elif len(temp) == 4:
        if temp[0] == "1": #NORTH
            north = True
        if temp[1] == "1": #SOUTH
            south = True
        if temp[2] == "1": #WEST
            west = True
        if temp[3] == "1": #EAST
            east = True
    
    if north: connections += 1
    if south: connections += 1
    if west: connections += 1
    if east: connections += 1

    #i don't have time to optimize this
    if connections == 0:
        return "$00"
    if connections == 1:
        if north: return "NORTH"
        if south: return "SOUTH"
        if west: return "WEST"
        if east: return "EAST"
    if connections >= 2:
        return write_connections(north, south, west, east)

def connection_pretty_printer(connections):
#map_id, connected_map_tile_pointer, current_map_tile_pointer, bigness, width, y, x, window_pointer
    output = ""

    for connection in connections.keys():
        connection = connections[connection]
        map_id = hex(connection["map_id"])[2:].zfill(2)
        connected_map_tile_pointer = connection["connected_map_tile_pointer"][2:]
        current_map_tile_pointer = connection["current_map_tile_pointer"][2:]
        bigness = hex(int(connection["bigness"], base))[2:].zfill(2)
        width = hex(int(connection["width"], base))[2:].zfill(2)
        y = hex(connection["y"])[2:].zfill(2)
        x = hex(connection["x"])[2:].zfill(2)
        window_pointer = connection["window_pointer"][2:]

        output += spacing + "db $" + map_id + " ; some map\n"
        output += spacing + "dw $" + connected_map_tile_pointer + ", $" + current_map_tile_pointer + " ; pointers (connected, current) (strip)\n"
        output += spacing + "db $" + bigness + ", $" + width + " ; bigness, width\n"
        output += spacing + "db $" + y + ", $" + x + " ; alignments (y, x)\n"
        output += spacing + "dw $" + window_pointer + " ; window\n\n"

    return output

def map_header_pretty_printer(map_header):
    address = map_header["address"]
    bank = map_header["bank"]
    id = map_header["id"]
    
    name = map_header["name"]
    asm_name = map_name_cleaner(name, id)
    if name == "FREEZE": return "" #skip freeze maps

    tileset = map_header["tileset"][2:]
    y = int(map_header["y"], base)
    x = int(map_header["x"], base)
    map_pointer = map_header["map_pointer"]
    texts_pointer = map_header["texts_pointer"]
    script_pointer = map_header["script_pointer"]
    connection_byte = map_header["connection_byte"]
    connections = map_header["connections"]
    object_data_pointer = map_header["object_data_pointer"]

    byte_size = 12 + (11 * len(connections.keys()))

    map_pointer = hex(offset_to_pointer(map_pointer))[2:]
    texts_pointer = hex(offset_to_pointer(texts_pointer))[2:]
    script_pointer = hex(offset_to_pointer(script_pointer))[2:]
    object_data_pointer = hex(offset_to_pointer(object_data_pointer))[2:]

    #formatting: hex(y)[2:].zill(2) or "%02x" % (y,)

    output  = asm_name + ": ; " + address + " to " + hex(int(address, base) + byte_size) + " (" + str(byte_size) + " bytes) (id=" + str(id) + ")\n"
    output += spacing + "db $" + str(tileset).zfill(2) + " ; tileset\n"
    output += spacing + "db $" + hex(y)[2:].zfill(2) + ", $" + hex(x)[2:].zfill(2) + " ; dimensions (y, x)\n"
    output += spacing + "dw $" + map_pointer + ", $" + texts_pointer + ", $" + script_pointer + " ; blocks, texts, scripts\n"
    output += spacing + "db " + connection_line(connection_byte) + " ; connections\n\n"
    
    if len(connections) > 0:
        output += spacing + "; connections data\n\n"
        output += connection_pretty_printer(connections)
        output += spacing + "; end connection data\n\n"

    #TODO: print out label for object_data_pointer if it's already in the file
    output += spacing + "dw $" + object_data_pointer + " ; objects\n"

    return output

def make_object_label_name(name):
    """make a label for the asm file
    like: PalletTownObject"""
    name = map_name_cleaner(name, None)
    return name.replace("_h", "") + "Object"

def make_text_label(map_name, id):
    """using standard object labels
    for instance, PalletTownText3"""
    label = map_name_cleaner(map_name, None)[:-2] + "Text" + str(id)
    return label

def object_data_pretty_printer(map_id):
    map = extract_maps.map_headers[map_id]
    output = ""

    label_name = make_object_label_name(map["name"])
    object_data_pointer = map["object_data_pointer"]
    object = map["object_data"]
    size = extract_maps.compute_object_data_size(object)
    
    output += label_name + ": ; " + object_data_pointer + " (size=" + str(size) + ")\n"
    output += spacing + "db $" + hex(object["maps_border_tile"])[2:] + " ; border tile\n"
    output += "\n"
    output += spacing + "db $" + hex(int(object["number_of_warps"]))[2:] + " ; warps\n"

    #warps
    for warp_id in object["warps"]:
        warp = object["warps"][warp_id]
        y = warp["y"]
        x = warp["x"]
        warp_to_point = warp["warp_to_point"]
        warp_to_map_id = warp["warp_to_map_id"]

        try:
            warp_to_map_constant = map_constants[warp_to_map_id]
        except Exception, exc:
            warp_to_map_constant = "$" + hex(warp_to_map_id)[2:]

        output += spacing + "db $" + hex(int(y))[2:] + ", $" + hex(int(x))[2:] + ", $" + hex(int(warp_to_point))[2:] + ", " + warp_to_map_constant + "\n"
    
    output += "\n"
    output += spacing + "db $" + hex(int(object["number_of_signs"]))[2:] + " ; signs\n"

    #signs
    for sign_id in object["signs"]:
        sign = object["signs"][sign_id]
        y = sign["y"]
        x = sign["x"]
        text_id = sign["text_id"]

        output += spacing + "db $" + hex(int(y))[2:] + ", $" + hex(int(x))[2:] + ", $" + hex(int(text_id))[2:] + " ; " + make_text_label(map["name"], text_id) + "\n"
    
    output += "\n"
    output += spacing + "db $" + hex(int(object["number_of_things"]))[2:] + " ; people\n"

    #people
    for thing_id in object["things"]:
        thing = object["things"][thing_id]
        
        ending = ""
        if thing["type"] == "item":
            ending = ", $" + hex(int(thing["item_number"]))[2:] + " ; item\n"
        elif thing["type"] == "trainer":
            ending = ", $" + hex(int(thing["trainer_type"]))[2:] + ", $" + hex(int(thing["pokemon_set"]))[2:] + " ; trainer\n"
        else:
            ending = " ; person\n"

        picture_number = hex(int(thing["picture_number"]))[2:]
        y = hex(int(thing["y"]) - 4)[2:]
        x = hex(int(thing["x"]) - 4)[2:]
        movement1 = hex(int(thing["movement1"]))[2:]
        movement2 = hex(int(thing["movement2"]))[2:]
        text_id = hex(int(thing["original_text_string_number"]))[2:]

        output += spacing + "db " + sprite_helper.sprites[thing["picture_number"]] + ", $" + y + " + 4, $" + x + " + 4, $" + movement1 + ", $" + movement2 + ", $" + text_id + ending
    
    output += "\n"

    if object["number_of_warps"] > 0:
        output += spacing + "; warp-to\n"

        for warp_to_id in object["warp_tos"]:
            warp_to = object["warp_tos"][warp_to_id]
            map_width = map["x"]
            warp_to_y = hex(int(warp_to["y"]))[2:]
            warp_to_x = hex(int(warp_to["x"]))[2:]

            try:
                previous_location = map_constants[object["warps"][warp_to_id]["warp_to_map_id"]]
                comment = " ; " + previous_location
            except Exception, exc:
                comment = ""

            output += spacing + "EVENT_DISP $" + map_width[2:] + ", $" + warp_to_y + ", $" + warp_to_x + comment + "\n"
            #output += spacing + "dw $" + hex(int(warp_to["event_displacement"][1]))[2:] + hex(int(warp_to["event_displacement"][0]))[2:] + "\n"
            #output += spacing + "db $" + hex(int(warp_to["y"]))[2:] + ", $" + hex(int(warp_to["x"]))[2:] + "\n"
            #output += "\n"
    
        output += "\n"

    while output[-1] == "\n":
        output = output[:-1]

    output += "\n"
    return output

def find_all_tx_fars():
    global all_texts
    tx_fars = [] #[map_id, text_id, text_pointer, tx_far_pointer, TX_FAR]
    for map_id in all_texts:
        map2 = all_texts[map_id]
        for text_id in map2.keys():
            text = map2[text_id]
            for command_id in text.keys():
                command = text[command_id]
                if "TX_FAR" in command.keys():
                    TX_FAR = command["TX_FAR"]
                    if TX_FAR[0]["type"] == 0x0:
                        tx_fars.append([map_id, text_id, analyze_texts.get_text_pointer(int(extract_maps.map_headers[map_id]["texts_pointer"], 16), text_id), command["pointer"], TX_FAR])
    return tx_fars

def tx_far_label_maker(map_name, text_id):
    label = "_" + map_name_cleaner(map_name, None)[:-2] + "Text" + str(text_id)
    return label

def tx_far_pretty_printer(tx_far):
    "pretty output for a tx_far"
    map_id = tx_far[0]
    map2 = extract_maps.map_headers[map_id]
    text_id = tx_far[1]
    text_pointer = tx_far[2]
    tx_far_start_address = tx_far[3]
    text_far = tx_far[4]
    lines = text_far[0]["lines"]
    label = tx_far_label_maker(map2["name"], text_id)

    #add the ending byte on the next line
    #lines[len(lines.keys())+1] = [text_far[1]["type"]]

    #add the ending byte to the last line- always seems $57
    lines[len(lines.keys())-1].append(text_far[1]["type"])

    output  = "\n"
    output += label + ": ; " + hex(tx_far_start_address) + "\n"
    first = True
    for line_id in lines:
        line = lines[line_id]
        output += spacing + "db "
        if first:
            output += "$0, "
            first = False
        
        quotes_open = False
        first_byte = True
        was_byte = False
        byte_count = 0
        for byte in line:
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

    #output += "\n"
    return output

def print_all_headers():
    maps = []
    for map in extract_maps.map_headers:
        maps.append(extract_maps.map_headers[map])
    
    maps = sorted(maps, key=lambda map: int(map["address"], base))

    for map in maps:
        output = map_header_pretty_printer(map)
        if output != "": print output

if __name__ == "__main__":
    #read binary data from file
    extract_maps.load_rom()

    #where are the map structs?
    extract_maps.load_map_pointers()

    #load map headers into memory
    extract_maps.read_all_map_headers()

    #load texts
    all_texts = analyze_texts.analyze_texts()

    #print them out
    #print_all_headers()

    #print out only the object data for pallet town (map 0)
    #print object_data_pretty_printer(0)

    #prepare to pretty print tx_fars
    #first you must load all_texts
    #tx_fars = find_all_tx_fars()
    #for entry in tx_fars:
    #    print tx_far_pretty_printer(entry)
