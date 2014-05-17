Mansion1_h: ; 0x442a3 to 0x442af (12 bytes) (bank=11) (id=165)
	db FACILITY ; tileset
	db MANSION_1_HEIGHT, MANSION_1_WIDTH ; dimensions (y, x)
	dw Mansion1Blocks, Mansion1TextPointers, Mansion1Script ; blocks, texts, scripts
	db $00 ; connections
	dw Mansion1Object ; objects
