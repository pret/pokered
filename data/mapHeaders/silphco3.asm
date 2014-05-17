SilphCo3_h: ; 0x59f4f to 0x59f5b (12 bytes) (id=208)
	db FACILITY ; tileset
	db SILPH_CO_3F_HEIGHT, SILPH_CO_3F_WIDTH ; dimensions (y, x)
	dw SilphCo3Blocks, SilphCo3TextPointers, SilphCo3Script ; blocks, texts, scripts
	db $00 ; connections
	dw SilphCo3Object ; objects
