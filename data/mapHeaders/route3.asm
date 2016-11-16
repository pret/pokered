Route3_h:
	db OVERWORLD ; tileset
	db ROUTE_3_HEIGHT, ROUTE_3_WIDTH ; dimensions (y, x)
	dw Route3Blocks, Route3TextPointers, Route3Script ; blocks, texts, scripts
	db NORTH | WEST ; connections
	NORTH_MAP_CONNECTION ROUTE_3, ROUTE_4, 25, 0, Route4Blocks
	WEST_MAP_CONNECTION ROUTE_3, PEWTER_CITY, -3, 1, PewterCityBlocks
	dw Route3Object ; objects
