SaffronHouse2_h:
	db HOUSE ; tileset
	db SAFFRON_HOUSE_2_HEIGHT, SAFFRON_HOUSE_2_WIDTH ; dimensions (y, x)
	dw SaffronHouse2Blocks, SaffronHouse2TextPointers, SaffronHouse2Script ; blocks, texts, scripts
	db $00 ; connections
	dw SaffronHouse2Object ; objects
