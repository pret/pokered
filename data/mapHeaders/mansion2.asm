Mansion2_h: ; 0x51fcc to 0x51fd8 (12 bytes) (id=214)
	db FACILITY ; tileset
	db MANSION_2_HEIGHT, MANSION_2_WIDTH ; dimensions (y, x)
	dw Mansion2Blocks, Mansion2TextPointers, Mansion2Script ; blocks, texts, scripts
	db $00 ; connections
	dw Mansion2Object ; objects
