MtMoon1_h: ; 0x499bc to 0x499c8 (12 bytes) (id=59)
	db CAVERN ; tileset
	db MT_MOON_1_HEIGHT, MT_MOON_1_WIDTH ; dimensions (y, x)
	dw MtMoon1Blocks, MtMoon1TextPointers, MtMoon1Script ; blocks, texts, scripts
	db $00 ; connections
	dw MtMoon1Object ; objects
