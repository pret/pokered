BluesHouse_h:
	db HOUSE ; tileset
	db BLUES_HOUSE_HEIGHT, BLUES_HOUSE_WIDTH ; dimensions (y, x)
	dw BluesHouseBlocks, BluesHouseTextPointers, BluesHouseScript ; blocks, texts, scripts
	db 0 ; connections
	dw BluesHouseObject ; objects
