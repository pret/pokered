MtMoon1_h:
	db CAVERN ; tileset
	db MT_MOON_1_HEIGHT, MT_MOON_1_WIDTH ; dimensions (y, x)
	dw MtMoon1Blocks, MtMoon1TextPointers, MtMoon1Script ; blocks, texts, scripts
	db $00 ; connections
	dw MtMoon1Object ; objects
