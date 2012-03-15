#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-14
#throw tilesets into separate files
import extract_maps
extract_maps.load_rom()

locations = {
"Tset00_GFX": [0x64000, 0x645E0, "00"],
"Tset01_GFX": [0x64DE0, 0x65270, "01"],
"Tset08_GFX": [0x653A0, 0x65980, "08"],
"Tset13_GFX": [0x65BB0, 0x66190, "13"],
"Tset0E_GFX": [0x66610, 0x66BF0, "0e"],
"Tset10_GFX": [0x66D60, 0x67350, "10"],
"Tset17_GFX": [0x676F0, 0x67B50, "17"],
"Tset05_GFX": [0x6807F, 0x6867F, "05"],
"Tset02_GFX": [0x68DBF, 0x693BF, "02"],
"Tset09_GFX": [0x6960F, 0x69BFF, "09"],
"Tset03_GFX": [0x6A3FF, 0x6A9FF, "03"],
"Tset16_GFX": [0x6B1FF, 0x6B7FF, "16"],
"Tset0F_GFX": [0x6C000, 0x6C5C0, "0f"],
"Tset11_GFX": [0x6CCA0, 0x6D0C0, "11"],
"Tset12_GFX": [0x6D8C0, 0x6DEA0, "12"],
"Tset0D_GFX": [0x6E390, 0x6E930, "0d"],
"Tset14_GFX": [0x6ED10, 0x6F2D0, "14"],
"Tset15_GFX": [0x6F670, 0x6FB20, "15"],
"Tset0B_GFX": [0x6FD60, 0x6FEF0, "0b"],
}

for tileset_id in locations.keys():
    tileset = locations[tileset_id]

    print "writing ../gfx/tilesets/" + tileset[2] + ".2bpp"
    fh = open("../gfx/tilesets/" + tileset[2] + ".2bpp", "w")
    fh.write(extract_maps.rom[tileset[0]:tileset[1]])
    fh.close()

print "Done."
