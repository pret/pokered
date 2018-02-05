SilphCo7_h:
	db FACILITY ; tileset
	db SILPH_CO_7F_HEIGHT, SILPH_CO_7F_WIDTH ; dimensions (y, x)
	dw SilphCo7Blocks, SilphCo7TextPointers, SilphCo7Script ; blocks, texts, scripts
	db 0 ; connections
	dw SilphCo7Object ; objects
