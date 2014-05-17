DiglettsCaveRoute2_h: ; 0x1dea4 to 0x1deb0 (12 bytes) (bank=7) (id=46)
	db CAVERN ; tileset
	db DIGLETTS_CAVE_EXIT_HEIGHT, DIGLETTS_CAVE_EXIT_WIDTH ; dimensions (y, x)
	dw DiglettsCaveRoute2Blocks, DiglettsCaveRoute2TextPointers, DiglettsCaveRoute2Script ; blocks, texts, scripts
	db $00 ; connections
	dw DiglettsCaveRoute2Object ; objects
