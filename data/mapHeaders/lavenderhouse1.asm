LavenderHouse1_h:
	db HOUSE ; tileset
	db LAVENDER_HOUSE_1_HEIGHT, LAVENDER_HOUSE_1_WIDTH ; dimensions (y, x)
	dw LavenderHouse1Blocks, LavenderHouse1TextPointers, LavenderHouse1Script ; blocks, texts, scripts
	db $00 ; connections
	dw LavenderHouse1Object ; objects
