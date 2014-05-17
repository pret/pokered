SilphCo7_h: ; 0x51b55 to 0x51b61 (12 bytes) (id=212)
	db FACILITY ; tileset
	db SILPH_CO_7F_HEIGHT, SILPH_CO_7F_WIDTH ; dimensions (y, x)
	dw SilphCo7Blocks, SilphCo7TextPointers, SilphCo7Script ; blocks, texts, scripts
	db $00 ; connections
	dw SilphCo7Object ; objects
