SilphCo9_h:
	db FACILITY ; tileset
	db SILPH_CO_9F_HEIGHT, SILPH_CO_9F_WIDTH ; dimensions (y, x)
	dw SilphCo9Blocks, SilphCo9TextPointers, SilphCo9Script ; blocks, texts, scripts
	db 0 ; connections
	dw SilphCo9Object ; objects
