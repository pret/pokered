DiglettsCaveEntranceRoute11_h:
	db CAVERN ; tileset
	db DIGLETTS_CAVE_ENTRANCE_HEIGHT, DIGLETTS_CAVE_ENTRANCE_WIDTH ; dimensions (y, x)
	dw DiglettsCaveEntranceRoute11Blocks, DiglettsCaveEntranceRoute11TextPointers, DiglettsCaveEntranceRoute11Script ; blocks, texts, scripts
	db 0 ; connections
	dw DiglettsCaveEntranceRoute11Object ; objects
