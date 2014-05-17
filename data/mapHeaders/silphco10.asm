SilphCo10_h: ; 0x5a12d to 0x5a139 (12 bytes) (id=234)
	db FACILITY ; tileset
	db SILPH_CO_10F_HEIGHT, SILPH_CO_10F_WIDTH ; dimensions (y, x)
	dw SilphCo10Blocks, SilphCo10TextPointers, SilphCo10Script ; blocks, texts, scripts
	db $00 ; connections
	dw SilphCo10Object ; objects
