Mansion4_h:
	db FACILITY ; tileset
	db MANSION_4_HEIGHT, MANSION_4_WIDTH ; dimensions (y, x)
	dw Mansion4Blocks, Mansion4TextPointers, Mansion4Script ; blocks, texts, scripts
	db 0 ; connections
	dw Mansion4Object ; objects
