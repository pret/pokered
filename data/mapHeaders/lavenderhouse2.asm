LavenderHouse2_h: ; 0x1d9a2 to 0x1d9ae (12 bytes) (bank=7) (id=151)
	db HOUSE ; tileset
	db LAVENDER_HOUSE_2_HEIGHT, LAVENDER_HOUSE_2_WIDTH ; dimensions (y, x)
	dw LavenderHouse2Blocks, LavenderHouse2TextPointers, LavenderHouse2Script ; blocks, texts, scripts
	db $00 ; connections
	dw LavenderHouse2Object ; objects
