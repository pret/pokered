Mansion4_h: ; 0x523ad to 0x523b9 (12 bytes) (id=216)
	db FACILITY ; tileset
	db MANSION_4_HEIGHT, MANSION_4_WIDTH ; dimensions (y, x)
	dw Mansion4Blocks, Mansion4TextPointers, Mansion4Script ; blocks, texts, scripts
	db $00 ; connections
	dw Mansion4Object ; objects
