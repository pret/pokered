Lance_h: ; 0x5a2a2 to 0x5a2ae (12 bytes) (id=113)
	db DOJO ; tileset
	db LANCES_ROOM_HEIGHT, LANCES_ROOM_WIDTH ; dimensions (y, x)
	dw LanceBlocks, LanceTextPointers, LanceScript ; blocks, texts, scripts
	db $00 ; connections
	dw LanceObject ; objects
