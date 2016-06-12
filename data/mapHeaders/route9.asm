Route9_h:
	db OVERWORLD ; tileset
	db ROUTE_9_HEIGHT, ROUTE_9_WIDTH ; dimensions (y, x)
	dw Route9Blocks, Route9TextPointers, Route9Script ; blocks, texts, scripts
	db WEST | EAST ; connections
	WEST_MAP_CONNECTION ROUTE_9, CERULEAN_CITY, -3, 1, CeruleanCityBlocks
	EAST_MAP_CONNECTION ROUTE_9, ROUTE_10, 0, 0, Route10Blocks, 1
	dw Route9Object ; objects
