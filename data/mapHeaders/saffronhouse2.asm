SaffronHouse2_h: ; 0x1de30 to 0x1de3c (12 bytes) (bank=7) (id=183)
	db HOUSE ; tileset
	db SAFFRON_HOUSE_2_HEIGHT, SAFFRON_HOUSE_2_WIDTH ; dimensions (y, x)
	dw SaffronHouse2Blocks, SaffronHouse2TextPointers, SaffronHouse2Script ; blocks, texts, scripts
	db $00 ; connections
	dw SaffronHouse2Object ; objects
