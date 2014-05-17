PewterHouse2_h: ; 0x1d63c to 0x1d648 (12 bytes) (bank=7) (id=57)
	db HOUSE ; tileset
	db PEWTER_HOUSE_2_HEIGHT, PEWTER_HOUSE_2_WIDTH ; dimensions (y, x)
	dw PewterHouse2Blocks, PewterHouse2TextPointers, PewterHouse2Script ; blocks, texts, scripts
	db $00 ; connections
	dw PewterHouse2Object ; objects
