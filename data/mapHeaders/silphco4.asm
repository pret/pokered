SilphCo4_h: ; 0x19cff to 0x19d0b (12 bytes) (bank=6) (id=209)
	db FACILITY ; tileset
	db SILPH_CO_4F_HEIGHT, SILPH_CO_4F_WIDTH ; dimensions (y, x)
	dw SilphCo4Blocks, SilphCo4TextPointers, SilphCo4Script ; blocks, texts, scripts
	db $00 ; connections
	dw SilphCo4Object ; objects
