Route5_h:
	db OVERWORLD ; tileset
	db ROUTE_5_HEIGHT, ROUTE_5_WIDTH ; dimensions (y, x)
	dw Route5Blocks, Route5TextPointers, Route5Script ; blocks, texts, scripts
	db NORTH | SOUTH ; connections
	NORTH_MAP_CONNECTION ROUTE_5, CERULEAN_CITY, -3, 2, CeruleanCityBlocks
	SOUTH_MAP_CONNECTION ROUTE_5, SAFFRON_CITY, -3, 2, SaffronCityBlocks, 1
	dw Route5Object ; objects
