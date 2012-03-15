#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-03
#utilities for working with text pointers
import extract_maps #rom, assert_rom, load_rom, calculate_pointer, load_map_pointers, read_all_map_headers, map_headers
from pretty_map_headers import map_name_cleaner
#import analyze_incbins #asm, offset_to_pointer, find_incbin_to_replace_for, split_incbin_line_into_three, generate_diff_insert, load_asm, isolate_incbins, process_incbins
spacing = "	"

def test_first_text_pointer_bytes(range=20): #30 for viridian city, 34 for cerulean city, 36 for celadon, 48 for fuchsia city, 50 for safron
    """
    does the first text pointer byte always point to (end address of text pointer list) + 1?

    range determines how far is acceptable.
    r=15 means 30 text pointers
    """

    for map_id in extract_maps.map_headers:
        map = extract_maps.map_headers[map_id]
        bank = int(map["bank"],16)
        text_list_pointer = int(map["texts_pointer"], 16)

        bad_names = ["FREEZE", "COPY: Cinnibar Mart", "COPY OF: Underground Tunnel Entrance (Route 6)", "COPY OF: Trashed House", "COPY OF: Underground Path Entrance (Route 7)"]
        if map["name"] in bad_names: continue

        #extract the bytes making up the first text pointer
        pointer_byte1 = ord(extract_maps.rom[text_list_pointer])
        pointer_byte2 = ord(extract_maps.rom[text_list_pointer+1])

        #swap the bytes
        temp = pointer_byte1
        pointer_byte1 = pointer_byte2
        pointer_byte2 = temp
        del temp

        #combine these into a single pointer
        partial_pointer = (pointer_byte2 + (pointer_byte1 << 8))

        #get the full pointer
        first_text_pointer = extract_maps.calculate_pointer(partial_pointer, bank)

        #if (first_text_pointer <= (text_list_pointer+range)):
        print "map " + map["name"] + " (" + str(map["id"]) + ")"
        print spacing + "text_pointer (list) = " + hex(text_list_pointer)
        print spacing + "first_text_pointer (first text) = " + hex(first_text_pointer)
        print spacing + "difference = " + str(first_text_pointer - text_list_pointer)
        #return False

    return True

if __name__ == "__main__":
    extract_maps.load_rom()
    extract_maps.load_map_pointers()
    extract_maps.read_all_map_headers()

    print test_first_text_pointer_bytes()
