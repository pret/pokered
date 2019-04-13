SilphCo2_h:
	db FACILITY ; tileset
	db SILPH_CO_2F_HEIGHT, SILPH_CO_2F_WIDTH ; dimensions (y, x)
	dw SilphCo2Blocks, SilphCo2TextPointers, SilphCo2Script ; blocks, texts, scripts
	db 0 ; connections
	dw SilphCo2Object ; objects
