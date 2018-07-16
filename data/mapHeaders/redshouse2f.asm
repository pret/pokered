RedsHouse2F_h:
	db REDS_HOUSE_2 ; tileset
	db REDS_HOUSE_2F_HEIGHT, REDS_HOUSE_2F_WIDTH ; dimensions (y, x)
	dw RedsHouse2FBlocks, RedsHouse2FTextPointers, RedsHouse2FScript ; blocks, texts, scripts
	db $00 ; connections
	dw RedsHouse2FObject ; objects
