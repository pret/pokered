MtMoon3_h:
	db CAVERN ; tileset
	db MT_MOON_3_HEIGHT, MT_MOON_3_WIDTH ; dimensions (y, x)
	dw MtMoon3Blocks, MtMoon3TextPointers, MtMoon3Script ; blocks, texts, scripts
	db 0 ; connections
	dw MtMoon3Object ; objects
