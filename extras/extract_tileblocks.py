#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-14
#split out blocksets into binary data files
# There's also code here to spit out asm for each blockset,
# but it's too many lines and will probably crash rgbasm.

import sys
import extract_maps
extract_maps.load_rom()
spacing = "	"

tileblocks = {
"Tset00_Block": [0x645E0, 0x64DE0, ""],
"Tset01_Block": [0x65270, 0x653A0, ""],
"Tset02_Block": [0x693BF, 0x6960F, ""],
"Tset03_Block": [0x6A9FF, 0x6B1FF, ""],
"Tset05_Block": [0x6867F, 0x68DBF, ""],
"Tset08_Block": [0x65980, 0x65BB0, ""],
"Tset09_Block": [0x69BFF, 0x6A3FF, ""],
"Tset0B_Block": [0x6FEF0, 0x70000, ""],
"Tset0D_Block": [0x6E930, 0x6ED10, ""],
"Tset0E_Block": [0x66BF0, 0x66D60, ""],
"Tset0F_Block": [0x6C5C0, 0x6CCA0, ""],
"Tset10_Block": [0x67350, 0x676F0, ""],
"Tset13_Block": [0x66190, 0x66610, ""],
"Tset11_Block": [0x6D0C0, 0x6D8C0, ""],
"Tset12_Block": [0x6DEA0, 0x6E390, ""],
"Tset14_Block": [0x6F2D0, 0x6F670, ""],
"Tset15_Block": [0x6FB20, 0x6FD60, ""],
"Tset16_Block": [0x6B7FF, 0x6C000, ""],
"Tset17_Block": [0x67B50, 0x68000, ""],
}

#10:02 <+sawakita> each block is composed by 4x4 tiles
#10:03 <+sawakita> so you can see a blockset as a list of 16-bytes long arrays
#10:07 <+sawakita> 4 bytes for each row of the block, left-to-right, top-to-down
#10:08 <+sawakita> so first byte is top-left tile
#10:08 <+kanzure> top-left tile byte is a tile id?
#10:08 <+sawakita> exactly
#10:09 <+kanzure> what does a tile id reference
#10:10 <+sawakita> tile ID $00 is the first tile of the tileset's graphics (first 16-bytes, since gfx are 2bpp)

output = ""
for tileblock_id in tileblocks.keys():
    tileblock = tileblocks[tileblock_id]
    start_address = tileblock[0]
    end_address = tileblock[1]
    block_count = (end_address - start_address) / 16
    main_data = extract_maps.rom[start_address:end_address]
    
    blockset_id = int(tileblock_id[4:6], 16)
    
    output = "; "
    output += tileblock_id + " - " + str(block_count) + " blocks (" + hex(start_address) + " to " + hex(end_address) + ")\n"
    #print tileblock_id + " has " + str(block_count) + " block tiles."
    for block_id in range(0, block_count):
        start_address2 = start_address + (16 * block_id)
        end_address2 = start_address + (16 * block_id) + 16
        data = extract_maps.rom[start_address2:end_address2]
    
        output += spacing + "; block " + str(block_id + 1) + " on " + tileblock_id + "\n"
        
        #output += spacing + spacing + "db $%.2x" % (ord(data[0]))
        #for data_bit in range(1,15):
        #    output += ", $%.2x" % (ord(data[data_bit]))
        #output += ", $%.2x" % (ord(data[15]))
        #output += "\n"

        for row_id in range(0,4):
            subdata = data[row_id * 4:row_id * 4 + 4]
            subdata2 = [ord(subdata[0]), ord(subdata[1]), ord(subdata[2]), ord(subdata[3])]

            output += spacing + spacing + " ; row " + str(row_id + 1) + "\n"
            output += spacing + spacing + spacing + "db $%.2x, $%.2x, $%.2x, $%.2x\n" % (subdata2[0], subdata2[1], subdata2[2], subdata2[3])
    
    fh = open("../gfx/blocksets/%.2x.bst" % (blockset_id), "w")
    fh.write(main_data)
    fh.close()

    print output

"""
Tset00_Block:
    ; block 1
        ; row 1
            db 0, 0, 0, 0
        ; row 2
            db 0, 0, 0, 0
        ; row 3
            db 0, 0, 0, 0
        ; row 4
            db 0, 0, 0, 0
"""

