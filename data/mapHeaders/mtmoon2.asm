MtMoon2_h: ; 0x51a36 to 0x51a42 (12 bytes) (id=60)
	db CAVERN ; tileset
	db MT_MOON_2_HEIGHT, MT_MOON_2_WIDTH ; dimensions (y, x)
	dw MtMoon2Blocks, MtMoon2TextPointers, MtMoon2Script ; blocks, texts, scripts
	db $00 ; connections
	dw MtMoon2Object ; objects
