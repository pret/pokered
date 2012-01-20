#!/usr/bin/python
#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-10
#show me an image
import Image
from math import floor
import extract_maps
import analyze_incbins

print "loading rom.."
extract_maps.load_rom()
#extract_maps.load_map_pointers()
#extract_maps.read_all_map_headers()

print "analyzing incbins.."
analyze_incbins.load_asm()
analyze_incbins.isolate_incbins()
analyze_incbins.process_incbins()

width = 1024
height = 1024

im = Image.new("P", (width, height))

#print "drawing base color..."
#for pos in range(0, len(extract_maps.rom)):
#    widthx = pos % width
#    heighty = floor(pos / height)
#    #im.putpixel((widthx, heighty), color_table[ord(extract_maps.rom[pos])])
#    im.putpixel((widthx, heighty), (0, 0, 0))

    #print "Searching for incbin... for pos= " + hex(pos)
    #incbin_found = analyze_incbins.find_incbin_to_replace_for(pos)
    #if incbin_found == None:
    #    im.putpixel((widthx, heighty), (0, 0, 0))
    #else:
    #    im.putpixel((widthx, heighty), (255, 255, 255))

print "drawing incbins..."
for incbin_key in analyze_incbins.processed_incbins:
    incbin = analyze_incbins.processed_incbins[incbin_key]
    start = incbin["start"]
    end = incbin["end"]

    for pos in range(start, end+1):
        widthx = pos % width
        heighty = floor(pos / height)
        im.putpixel((widthx, heighty), 255)

im.save("test.png")
