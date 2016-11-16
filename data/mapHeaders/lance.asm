Lance_h:
	db DOJO ; tileset
	db LANCES_ROOM_HEIGHT, LANCES_ROOM_WIDTH ; dimensions (y, x)
	dw LanceBlocks, LanceTextPointers, LanceScript ; blocks, texts, scripts
	db $00 ; connections
	dw LanceObject ; objects
