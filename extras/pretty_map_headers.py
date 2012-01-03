#!/usr/bin/python
#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-02
#purpose: dump asm for each map header
import json
import extract_maps
import random
import string

base = 16
spacing = "    "

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
        name += "_" + random_hash() + "_h"
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

    output  = asm_name + ": ; " + address + " to " + hex(int(address, base) + byte_size) + " (" + str(byte_size) + " bytes) (bank=" + str(int(bank, base)) + ") (id=" + str(id) + ")\n"
    output += spacing + "db $" + str(tileset).zfill(2) + " ; tileset\n"
    output += spacing + "db $" + hex(y)[2:].zfill(2) + ", $" + hex(x)[2:].zfill(2) + " ; dimensions (y, x)\n"
    output += spacing + "dw $" + map_pointer + ", $" + texts_pointer + ", $" + script_pointer + " ; blocks, texts, scripts\n"
    output += spacing + "db " + connection_line(connection_byte) + " ; connections\n\n"
    output += spacing + "; connections data\n\n"
    output += connection_pretty_printer(connections)
    output += spacing + "; end connection data\n\n"
    output += spacing + "dw $" + object_data_pointer + " ; objects\n"

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

    #print them out
    print_all_headers()
