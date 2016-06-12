PewterHouse1_h:
	db HOUSE ; tileset
	db PEWTER_HOUSE_1_HEIGHT, PEWTER_HOUSE_1_WIDTH ; dimensions (y, x)
	dw PewterHouse1Blocks, PewterHouse1TextPointers, PewterHouse1Script ; blocks, texts, scripts
	db $00 ; connections
	dw PewterHouse1Object ; objects
