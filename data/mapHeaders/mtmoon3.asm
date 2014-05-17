MtMoon3_h: ; 0x49cff to 0x49d0b (12 bytes) (id=61)
	db CAVERN ; tileset
	db MT_MOON_3_HEIGHT, MT_MOON_3_WIDTH ; dimensions (y, x)
	dw MtMoon3Blocks, MtMoon3TextPointers, MtMoon3Script ; blocks, texts, scripts
	db $00 ; connections
	dw MtMoon3Object ; objects
