#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-15
#dump map height/width constants
import extract_maps
from pretty_map_headers import map_name_cleaner, map_constants

def get_map_size_constants(do_sed=False):
    output = ""
    sed_lines = ""
    for map_id in extract_maps.map_headers.keys():
        if map_id in extract_maps.bad_maps: continue #skip

        map2 = extract_maps.map_headers[map_id]
        base_name = map_name_cleaner(map2["name"], None)[:-2]
        constant_name = map_constants[map_id]

        height = int(map2["y"], 16)
        width  = int(map2["x"], 16)

        output += "; " + base_name + "_h map_id=" + str(map_id) + "\n"
        output += constant_name + "_HEIGHT EQU $%.2x\n" % (height)
        output += constant_name + "_WIDTH  EQU $%.2x\n" % (width)
        output += "\n"

        sed_lines += "sed -i 's/" + base_name + "Height/" + constant_name + "_HEIGHT" + "/g' main.asm" + "\n"
        sed_lines += "sed -i 's/" + base_name + "Width/" + constant_name + "_WIDTH" + "/g' main.asm" + "\n"

    if do_sed:
        return sed_lines
    else:
        return output

if __name__ == "__main__":
    extract_maps.load_rom()
    extract_maps.load_map_pointers()
    extract_maps.read_all_map_headers()
    print get_map_size_constants(do_sed=True)
