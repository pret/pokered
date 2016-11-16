Route16House_h:
	db HOUSE ; tileset
	db ROUTE_16_HOUSE_HEIGHT, ROUTE_16_HOUSE_WIDTH ; dimensions (y, x)
	dw Route16HouseBlocks, Route16HouseTextPointers, Route16HouseScript ; blocks, texts, scripts
	db $00 ; connections
	dw Route16HouseObject ; objects
