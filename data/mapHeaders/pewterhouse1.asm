PewterHouse1_h: ; 0x1d5e7 to 0x1d5f3 (12 bytes) (bank=7) (id=55)
	db HOUSE ; tileset
	db PEWTER_HOUSE_1_HEIGHT, PEWTER_HOUSE_1_WIDTH ; dimensions (y, x)
	dw PewterHouse1Blocks, PewterHouse1TextPointers, PewterHouse1Script ; blocks, texts, scripts
	db $00 ; connections
	dw PewterHouse1Object ; objects
