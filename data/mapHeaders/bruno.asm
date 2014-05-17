Bruno_h: ; 0x762ca to 0x762d6 (12 bytes) (id=246)
	db GYM ; tileset
	db BRUNOS_ROOM_HEIGHT, BRUNOS_ROOM_WIDTH ; dimensions (y, x)
	dw BrunoBlocks, BrunoTextPointers, BrunoScript ; blocks, texts, scripts
	db $00 ; connections
	dw BrunoObject ; objects
