SilphCo1_h:
	db FACILITY ; tileset
	db SILPH_CO_1F_HEIGHT, SILPH_CO_1F_WIDTH ; dimensions (y, x)
	dw SilphCo1Blocks, SilphCo1TextPointers, SilphCo1Script ; blocks, texts, scripts
	db $00 ; connections
	dw SilphCo1Object ; objects
