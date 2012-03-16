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

im = Image.new("P", (width, height), 0)

im.putpalette([
    0, 0, 0,
    126, 30, 156,
])

print "drawing incbins..."
for incbin_key in analyze_incbins.processed_incbins:
    incbin = analyze_incbins.processed_incbins[incbin_key]
    start = incbin["start"]
    end = incbin["end"]

    for pos in range(start, end+1):
        widthx = int(pos % width)
        heighty = int(floor(pos / height))
        im.putpixel((widthx, heighty), 1)

im.save("test.png")
