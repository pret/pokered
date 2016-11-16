DiglettsCaveRoute2_h:
	db CAVERN ; tileset
	db DIGLETTS_CAVE_EXIT_HEIGHT, DIGLETTS_CAVE_EXIT_WIDTH ; dimensions (y, x)
	dw DiglettsCaveRoute2Blocks, DiglettsCaveRoute2TextPointers, DiglettsCaveRoute2Script ; blocks, texts, scripts
	db $00 ; connections
	dw DiglettsCaveRoute2Object ; objects
