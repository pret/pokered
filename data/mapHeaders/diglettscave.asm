DiglettsCave_h: ; 0x61f62 to 0x61f6e (12 bytes) (id=197)
	db CAVERN ; tileset
	db DIGLETTS_CAVE_HEIGHT, DIGLETTS_CAVE_WIDTH ; dimensions (y, x)
	dw DiglettsCaveBlocks, DiglettsCaveTextPointers, DiglettsCaveScript ; blocks, texts, scripts
	db $00 ; connections
	dw DiglettsCaveObject ; objects
