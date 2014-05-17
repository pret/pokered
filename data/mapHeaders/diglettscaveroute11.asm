DiglettsCaveEntranceRoute11_h: ; 0x1e5ae to 0x1e5ba (12 bytes) (bank=7) (id=85)
	db CAVERN ; tileset
	db DIGLETTS_CAVE_ENTRANCE_HEIGHT, DIGLETTS_CAVE_ENTRANCE_WIDTH ; dimensions (y, x)
	dw DiglettsCaveEntranceRoute11Blocks, DiglettsCaveEntranceRoute11TextPointers, DiglettsCaveEntranceRoute11Script ; blocks, texts, scripts
	db $00 ; connections
	dw DiglettsCaveEntranceRoute11Object ; objects
