#!/usr/bin/python
#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-15
#dump map height/width constants
import extract_maps
from pretty_map_headers import map_name_cleaner

def get_map_size_constants():
    output = ""
    for map_id in extract_maps.map_headers.keys():
        if map_id in extract_maps.bad_maps: continue #skip

        map2 = extract_maps.map_headers[map_id]
        base_name = map_name_cleaner(map2["name"], None)[:-2]

        height = int(map2["y"], 16)
        width  = int(map2["x"], 16)

        output += "; " + base_name + "_h map_id=" + str(map_id) + "\n"
        output += base_name + "Height EQU $%.2x\n" % (height)
        output += base_name + "Width  EQU $%.2x\n" % (width)
        output += "\n"
    return output

if __name__ == "__main__":
    extract_maps.load_rom()
    extract_maps.load_map_pointers()
    extract_maps.read_all_map_headers()
    print get_map_size_constants()
