#!/usr/bin/python
#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-15
#replace dimensions with constants
import sys #for non-newline-terminated output :/
from add_map_labels_to_map_headers import find_with_start_of_line
from pretty_map_headers import map_name_cleaner, spacing

asm = None
asm_lines = None
def load_asm():
    global asm, asm_lines
    asm = open("../common.asm", "r").read()
    asm_lines = asm.split("\n")

def find_line_starting_with(value):
    global asm_lines
    id = 0
    for line in asm_lines:
        if len(line) < len(value): continue
        if line[:len(value)] == value:
            return asm_lines.index(line)
        id += 1
    return False #not found

def replace_dimensions():
    global asm_lines
    for map_id in extract_maps.map_headers.keys():
        if map_id in extract_maps.bad_maps: continue #skip
        map1 = extract_maps.map_headers[map_id]
        label_name = map_name_cleaner(map1["name"], None)
        clean_name = label_name[:-2]

        line_number = find_line_starting_with(label_name)
        if line_number == False: continue #skip, not found

        if "dimensions" in asm_lines[line_number + 2] and "$" in asm_lines[line_number + 2] and not "\t" in asm_lines[line_number+2]:
            asm_lines[line_number + 2] = spacing + "db " + clean_name + "Height, " + clean_name + "Width ; dimensions (y, x)"

if __name__ == "__main__":
    import extract_maps
    extract_maps.load_rom()
    extract_maps.load_map_pointers()
    extract_maps.read_all_map_headers()

    load_asm()
    replace_dimensions()
    sys.stdout.write("\n".join(asm_lines))

