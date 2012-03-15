#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-15
#replace dimensions with constants
import sys #for non-newline-terminated output :/
from add_map_labels_to_map_headers import find_with_start_of_line
from pretty_map_headers import map_name_cleaner, spacing, offset_to_pointer, map_constants
from connection_helper import print_connections
from ctypes import c_int8

# X/Y_Movement_Of_Connection
#~~~~~~~~~~~~~~~~~~~~~~~~~
#
# A X movement is how many map blocks there are to the left of one of your north/south connections.
# A Y movement is how many map blocks there are above your west/east connection.

#===============================================================================
# #4-#5 : Current Map Position
#===============================================================================
#
# This points to the part of the current map (further up in RAM)
# that the connection strips upperleft block is placed on the current map.
#
# ____________________
# Connection |
# Direction  | Formula
# ___________|_______
#
#     North: C6EB + X_Movement_of_Connection Strip
#
#     South: C6EB + (Height of Map + 3) * (Width of Map + 6) +
#                   X_Movement_of_Connection Strip
#
#      West: C6E8 + (Width of Map + 6) * (Y_Movement_of_"Connection Strip" + 3)
#
#      East: C6E5 + (Width of Map + 6) * (Y_Movement_of_"Connection Strip" + 4)

asm = None
asm_lines = None
def load_asm():
    global asm, asm_lines
    asm = open("../main.asm", "r").read()
    asm_lines = asm.split("\n")

def get_xy_movement_of_connection_strip(map_id, connection_id):
    map1 = extract_maps.map_headers[map_id]
    connections = map1["connections"]
    connection = connections[connection_id]
    direction = connection["direction"]
    current_map_location = int(connection["current_map_tile_pointer"], 16)

    map2 = extract_maps.map_headers[connection["map_id"]]
    map2_height = int(map2["y"], 16)
    map2_width = int(map2["x"], 16)

    y_mov = None
    #if   direction == "WEST":
    #    y_mov = ((current_map_location - 0xC6E8) / (map2_width + 6)) - 3
    #elif direction == "EAST":
    #    y_mov = ((current_map_location - 0xC6E5) / (map2_width + 6)) - 4
    if direction in ["WEST", "EAST"]:
        y_mov = c_int8(connection["y"]).value / -2

    x_mov = None
    #if   direction == "NORTH":
    #    x_mov = current_map_location - 0xC6EB
    #elif direction == "SOUTH":
    #    x_mov = current_map_location - 0xC6EB - ((map2_height + 3) * (map2_width + 6))
    if direction in ["NORTH", "SOUTH"]:
        x_mov = c_int8(connection["x"]).value / -2

    return {"y_mov": y_mov, "x_mov": x_mov}

def find_line_starting_with(value):
    global asm_lines
    id = 0
    for line in asm_lines:
        if len(line) < len(value): continue
        if line[:len(value)] == value:
            return asm_lines.index(line)
        id += 1
    return False #not found

def current_map_position_formula(map_id, connection_id):
    map1_id     = map_id
    map1        = extract_maps.map_headers[map_id]
    connections = map1["connections"]
    connection  = connections[connection_id]
    map1_height = int(map1["y"], 16)
    map1_width  = int(map1["x"], 16)
    map1_name   = map1["name"]
    map1_name   = map_name_cleaner(map1_name, None)[:-2]
    
    direction            = connection["direction"]
    current_map_location = int(connection["current_map_tile_pointer"], 16)

    map2_id     = connection["map_id"]
    map2        = extract_maps.map_headers[map2_id]
    map2_name   = map2["name"]
    map2_name   = map_name_cleaner(map2_name, None)[:-2]
    map2_height = int(map2["y"], 16)
    map2_width  = int(map2["x"], 16)
    
    y_mov = None
    if   direction == "WEST":
        y_mov = ((current_map_location - 0xC6E8) / (map1_width + 6)) - 3
    elif direction == "EAST":
        y_mov = ((current_map_location - 0xC6E5) / (map1_width + 6)) - 4
    
    x_mov = None
    if   direction == "NORTH":
        x_mov = current_map_location - 0xC6EB
    elif direction == "SOUTH":
        x_mov = current_map_location - 0xC6EB - ((map1_height + 3) * (map1_width + 6))

    formula = ""
    if   direction == "NORTH":
        formula = "$C6EB + " + str(x_mov)
    elif direction == "SOUTH":
        formula = "$C6EB + (" + map1_name + "Height + 3) * (" + map1_name + "Width + 6) + " + str(x_mov)
    elif direction == "WEST":
        formula = "$C6E8 + (" + map1_name + "Width + 6) * (" + str(y_mov) + " + 3)"
    elif direction == "EAST":
        formula = "$C6E5 + (" + map1_name + "Width + 6) * (" + str(y_mov) + " + 4)"

    return formula

def replace_values():
    global asm_lines #0-15 ok
    for map_id in [3]: #extract_maps.map_headers.keys():
        if map_id in extract_maps.bad_maps: continue #skip
        if map_id == 12: continue #skip Route 1

        map1 = extract_maps.map_headers[map_id]
        label_name = map_name_cleaner(map1["name"], None)
        clean_name = label_name[:-2]

        line_number = find_line_starting_with(label_name)
        if line_number == False: continue #skip, not found

        #replace dimensions if necessary
        if "dimensions" in asm_lines[line_number + 2] and "$" in asm_lines[line_number + 2] and not "\t" in asm_lines[line_number+2]:
            asm_lines[line_number + 2] = spacing + "db " + clean_name + "Height, " + clean_name + "Width ; dimensions (y, x)"

        #skip the rest of this if there are no connections
        if len(map1["connections"]) == 0: continue
        if not "; connections data" in asm_lines[line_number + 6]: continue

        connection_offset = line_number + 8

        for connection_id in map1["connections"]:
            connection  = map1["connections"][connection_id]
            direction   = connection["direction"]
            map2_id     = connection["map_id"]
            map2        = extract_maps.map_headers[map2_id]
            map2_name   = map_name_cleaner(map2["name"], None)[:-2]
            map2_height = int(map2["y"], 16)
            map2_width  = int(map2["x"], 16)

            movements   = get_xy_movement_of_connection_strip(map_id, connection_id)
            y_mov       = movements["y_mov"]
            x_mov       = movements["x_mov"]

            #replace the first two pointers
            if "  dw " in asm_lines[connection_offset + 1]:
                formula = print_connections(map_id, in_connection_id=connection_id)
                formula2 = current_map_position_formula(map_id, connection_id)

                temp_line = asm_lines[connection_offset + 1]
                temp_line = spacing + "dw " + formula + " ; connection strip location\n" #connection strip location
                temp_line += spacing + "dw " + formula2 + " ; current map position" #current map position

                asm_lines[connection_offset + 1] = temp_line

            #bigness, width
            if "bigness, width" in asm_lines[connection_offset + 2]:
                temp_line = spacing + "db "
                
                if int(connection["bigness"],16) == map2_width:
                    temp_line += map2_name + "Width"
                elif int(connection["bigness"],16) == map2_height:
                    temp_line += map2_name + "Height"
                else: #dunno wtf to do
                    temp_line += "$" + hex(int(connection["bigness"],16))[2:]
                #if   direction in ["NORTH", "SOUTH"]:
                #    temp_line += map2_name + "Width"
                #elif direction in ["WEST", "EAST"]:
                #    temp_line += map2_name + "Height"

                temp_line += ", " + map2_name + "Width"

                temp_line += " ; bigness, width"
                asm_lines[connection_offset + 2] = temp_line

            #alignments (y, x)
            if "alignments (y, x)" in asm_lines[connection_offset + 3]:
                temp_line = spacing + "db "

                if   direction == "NORTH":
                    temp_line += "(" + map2_name + "Height * 2) - 1"
                elif direction == "SOUTH":
                    temp_line += "0"
                elif direction in ["WEST", "EAST"]:
                    #TODO: this might be y_mov/4 ??
                    temp_line += "(" + str(y_mov) + " * -2)"

                temp_line += ", "

                #Relative X-Position of player after entering connected map.
                if   direction in ["NORTH", "SOUTH"]:
                    temp_line += "(" + str(x_mov) + " * -2)"
                elif direction == "WEST":
                    temp_line += "(" + map2_name + "Width * 2) - 1"
                elif direction == "EAST":
                    temp_line += "0"

                temp_line += " ; alignments (y, x)"
                asm_lines[connection_offset + 3] = temp_line

            #window
            if "; window" in asm_lines[connection_offset + 4]:
                temp_line = spacing + "dw "
                
                if   direction == "NORTH":
                    temp_line += "$C6E9 + " + map2_name + "Height * (" + map2_name + "Width + 6)"
                elif direction in ["SOUTH", "EAST"]:
                    temp_line += "$C6EF + " + map2_name + "Width"
                elif direction == "WEST":
                    temp_line += "$C6EE + 2 * " + map2_name + "Width"

                temp_line += " ; window"
                asm_lines[connection_offset + 4] = temp_line

            #jump to the next connection
            connection_offset += 6

if __name__ == "__main__":
    import extract_maps
    extract_maps.load_rom()
    extract_maps.load_map_pointers()
    extract_maps.read_all_map_headers()

    load_asm()
    replace_values()
    sys.stdout.write("\n".join(asm_lines))

