Mansion2_h:
	db FACILITY ; tileset
	db MANSION_2_HEIGHT, MANSION_2_WIDTH ; dimensions (y, x)
	dw Mansion2Blocks, Mansion2TextPointers, Mansion2Script ; blocks, texts, scripts
	db $00 ; connections
	dw Mansion2Object ; objects
