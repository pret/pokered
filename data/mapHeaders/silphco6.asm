SilphCo6_h: ; 0x1a19d to 0x1a1a9 (12 bytes) (bank=6) (id=211)
	db FACILITY ; tileset
	db SILPH_CO_6F_HEIGHT, SILPH_CO_6F_WIDTH ; dimensions (y, x)
	dw SilphCo6Blocks, SilphCo6TextPointers, SilphCo6Script ; blocks, texts, scripts
	db $00 ; connections
	dw SilphCo6Object ; objects
