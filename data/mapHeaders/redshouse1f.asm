RedsHouse1F_h:
	db REDS_HOUSE_1 ; tileset
	db REDS_HOUSE_1F_HEIGHT, REDS_HOUSE_1F_WIDTH ; dimensions (y, x)
	dw RedsHouse1FBlocks, RedsHouse1FTextPointers, RedsHouse1FScript ; blocks, texts, scripts
	db 0 ; connections
	dw RedsHouse1FObject ; objects
