Route2House_h:
	db HOUSE ; tileset
	db ROUTE_2_HOUSE_HEIGHT, ROUTE_2_HOUSE_WIDTH ; dimensions (y, x)
	dw Route2HouseBlocks, Route2HouseTextPointers, Route2HouseScript ; blocks, texts, scripts
	db $00 ; connections
	dw Route2HouseObject ; objects
