SilphCo5_h: ; 0x19f2b to 0x19f37 (12 bytes) (bank=6) (id=210)
	db FACILITY ; tileset
	db SILPH_CO_5F_HEIGHT, SILPH_CO_5F_WIDTH ; dimensions (y, x)
	dw SilphCo5Blocks, SilphCo5TextPointers, SilphCo5Script ; blocks, texts, scripts
	db $00 ; connections
	dw SilphCo5Object ; objects
