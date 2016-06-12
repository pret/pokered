Route11_h:
	db OVERWORLD ; tileset
	db ROUTE_11_HEIGHT, ROUTE_11_WIDTH ; dimensions (y, x)
	dw Route11Blocks, Route11TextPointers, Route11Script ; blocks, texts, scripts
	db WEST | EAST ; connections
	WEST_MAP_CONNECTION ROUTE_11, VERMILION_CITY, -3, 1, VermilionCityBlocks
	EAST_MAP_CONNECTION ROUTE_11, ROUTE_12, -3, 24, Route12Blocks, 1
	dw Route11Object ; objects
