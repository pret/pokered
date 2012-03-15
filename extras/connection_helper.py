#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-15
#help with connection math
import extract_maps
from pretty_map_headers import map_constants, map_name_cleaner, offset_to_pointer

def print_connections(map_id, in_connection_id=None, do_output=False):
    map1        = extract_maps.map_headers[map_id]
    map1_name   = map1["name"]
    connections = map1["connections"]
    output = ""
    
    if in_connection_id != None:
        connections2 = {}
        connections2[in_connection_id] = connections[in_connection_id]
        connections = connections2
    
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

        output +=  map1_name + " (id=" + str(map_id) + ") " + direction + " to " + map2_name + "\n"
        output +=  "map2 blocks pointer: " + hex(map2_blocks_pointer) + "\n"
        output +=  "map2 height: " + str(map2_height) + "\n"
        output +=  "map2 width: " + str(map2_width) + "\n"
        output +=  "map1 connection pointer: " + hex(connected_pointer) + "\n"
        
        shift = 0
        #not sure about the calculated shift for NORTH or SOUTH
        if  direction == "NORTH":
            calculated = map2_blocks_pointer + (map2_height - 3) * map2_width
            result = connected_pointer - calculated
            if result != 0:
                shift = result #seems to always be 2?
                calculated = map2_blocks_pointer + (map2_height - 3) * map2_width + shift
                output += "shift: " + str(shift) + "\n"
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
                output += "shift: " + str(shift) + "\n"
                formula += " + " + str(shift)
        elif direction == "WEST":
            calculated = map2_blocks_pointer - 3 + (map2_width)
            result = connected_pointer - calculated
            formula = map2_cname + "Blocks - 3 + (" + map2_cname + "Width)"
            if result != 0:
                shift = result / map2_width
                shift += 1
                calculated = map2_blocks_pointer - 3 + (map2_width * shift)
                output += "shift: " + str(shift) + "\n"
                formula = map2_cname + "Blocks - 3 + (" + map2_cname + "Width * " + str(shift) + ")"
        elif direction == "EAST":
            calculated = map2_blocks_pointer + (map2_width)
            result = connected_pointer - calculated
            output += ".. result is: " + str(result) + "\n"
            formula = map2_cname + "Blocks + (" + map2_cname + "Width)"
            if result != 0:
                shift = result / map2_width
                shift += 1
                calculated = map2_blocks_pointer + (map2_width * shift)
                output += "shift: " + str(shift) + "\n"
                formula = map2_cname + "Blocks" + " + (" + map2_cname + "Width * " + str(shift) + ")"
        
        output += "formula: " + formula + "\n"

        result = connected_pointer - calculated
        output += "result: " + str(result) + "\n"

        output += "\n\n"
    
    if in_connection_id != None:
        return formula
    if do_output == True:
        return output

if __name__ == "__main__":
    extract_maps.load_rom()
    extract_maps.load_map_pointers()
    extract_maps.read_all_map_headers()
    
    #trouble:
    #print_connections(13)
    #print_connections(15)
    
    for map_id in extract_maps.map_headers.keys():
        if map_id not in extract_maps.bad_maps:
            print print_connections(map_id, do_output=True)
