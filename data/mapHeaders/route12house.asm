Route12House_h:
	db HOUSE ; tileset
	db ROUTE_12_HOUSE_HEIGHT, ROUTE_12_HOUSE_WIDTH ; dimensions (y, x)
	dw Route12HouseBlocks, Route12HouseTextPointers, Route12HouseScript ; blocks, texts, scripts
	db 0 ; connections
	dw Route12HouseObject ; objects
