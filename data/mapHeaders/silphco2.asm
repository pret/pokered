SilphCo2_h: ; 0x59ce5 to 0x59cf1 (12 bytes) (id=207)
	db FACILITY ; tileset
	db SILPH_CO_2F_HEIGHT, SILPH_CO_2F_WIDTH ; dimensions (y, x)
	dw SilphCo2Blocks, SilphCo2TextPointers, SilphCo2Script ; blocks, texts, scripts
	db $00 ; connections
	dw SilphCo2Object ; objects
