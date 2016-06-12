DiglettsCave_h:
	db CAVERN ; tileset
	db DIGLETTS_CAVE_HEIGHT, DIGLETTS_CAVE_WIDTH ; dimensions (y, x)
	dw DiglettsCaveBlocks, DiglettsCaveTextPointers, DiglettsCaveScript ; blocks, texts, scripts
	db $00 ; connections
	dw DiglettsCaveObject ; objects
