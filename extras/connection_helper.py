#!/usr/bin/python
#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-15
#help with connection math
import extract_maps
from pretty_map_headers import map_constants, map_name_cleaner, offset_to_pointer

def print_connections(map_id):
    map1        = extract_maps.map_headers[map_id]
    map1_name   = map1["name"]
    connections = map1["connections"]
    
    for connection_id in connections:
        connection          = connections[connection_id]
        direction           = connection["direction"]
        connected_pointer   = int(connection["connected_map_tile_pointer"], 16)
        current_pointer     = int(connection["current_map_tile_pointer"], 16)
        map2_id             = connection["map_id"]
        map2                = extract_maps.map_headers[map2_id]
        map2_name           = map2["name"]
        map2_cname          = map_name_cleaner(map2["name"], None)[:-2]
        map2_bank           = int(map2["bank"], 16)
        map2_blocks_pointer = offset_to_pointer(int(map2["map_pointer"], 16))
        map2_height         = int(map2["y"], 16)
        map2_width          = int(map2["x"], 16)

        print map1_name + " (id=" + str(map_id) + ") " + direction + " to " + map2_name
        print "map2 blocks pointer: " + hex(map2_blocks_pointer)
        print "map2 height: " + str(map2_height)
        print "map2 width: " + str(map2_width)
        print "map1 connection pointer: " + hex(connected_pointer)
        
        shift = 0
        #not sure about the calculated shift for NORTH or SOUTH
        if  direction == "NORTH":
            calculated = map2_blocks_pointer + (map2_height - 3) * map2_width
            result = connected_pointer - calculated
            if result != 0:
                shift = result #seems to always be 2?
                calculated = map2_blocks_pointer + (map2_height - 3) * map2_width + shift
                print "shift: " + str(shift)
                formula = map2_cname + "Blocks + (" + map2_cname + "Height - 3) * " + map2_cname + "Width + " + str(shift)
            else:
                formula = map2_cname + "Blocks + (" + map2_cname + "Height - 3) * " + map2_cname + "Width"
        elif direction == "SOUTH":
            calculated = map2_blocks_pointer
            result = connected_pointer - calculated
            formula = map2_cname + "Blocks"
            if result != 0:
                shift = result
                calculated = map2_blocks_pointer + shift
                print "shift: " + str(shift)
                formula += " + " + str(shift)
        elif direction == "WEST":
            calculated = map2_blocks_pointer - 3 + (map2_width)
            result = connected_pointer - calculated
            formula = map2_cname + " - 3 + (" + map2_cname + "Width)"
            if result != 0:
                shift = result / map2_width
                shift += 1
                calculated = map2_blocks_pointer - 3 + (map2_width * shift)
                print "shift: " + str(shift)
                formula = map2_cname + " - 3 + (" + map2_cname + "Width * " + str(shift) + ")"
        elif direction == "EAST":
            calculated = map2_blocks_pointer + (map2_width)
            result = connected_pointer - calculated
            print ".. result is: " + str(result)
            formula = map2_cname + " + (" + map2_cname + "Width)"
            if result != 0:
                shift = result / map2_width
                shift += 1
                calculated = map2_blocks_pointer + (map2_width * shift)
                print "shift: " + str(shift)
                formula = map2_cname + " + (" + map2_cname + "Width * " + str(shift) + ")"
        
        print "formula: " + formula

        result = connected_pointer - calculated
        print "result: " + str(result) 

        print "\n",

if __name__ == "__main__":
    extract_maps.load_rom()
    extract_maps.load_map_pointers()
    extract_maps.read_all_map_headers()
    
    #trouble:
    #print_connections(13)
    #print_connections(15)
    
    for map_id in extract_maps.map_headers.keys():
        if map_id not in extract_maps.bad_maps:
            print_connections(map_id)
