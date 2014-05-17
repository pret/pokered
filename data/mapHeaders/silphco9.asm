SilphCo9_h: ; 0x5d7af to 0x5d7bb (12 bytes) (id=233)
	db FACILITY ; tileset
	db SILPH_CO_9F_HEIGHT, SILPH_CO_9F_WIDTH ; dimensions (y, x)
	dw SilphCo9Blocks, SilphCo9TextPointers, SilphCo9Script ; blocks, texts, scripts
	db $00 ; connections
	dw SilphCo9Object ; objects
