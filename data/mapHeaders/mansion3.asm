Mansion3_h: ; 0x521e2 to 0x521ee (12 bytes) (id=215)
	db FACILITY ; tileset
	db MANSION_3_HEIGHT, MANSION_3_WIDTH ; dimensions (y, x)
	dw Mansion3Blocks, Mansion3TextPointers, Mansion3Script ; blocks, texts, scripts
	db $00 ; connections
	dw Mansion3Object ; objects
