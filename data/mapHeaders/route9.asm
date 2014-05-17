Route9_h: ; 0x54686 to 0x546a8 (34 bytes) (id=20)
	db OVERWORLD ; tileset
	db ROUTE_9_HEIGHT, ROUTE_9_WIDTH ; dimensions (y, x)
	dw Route9Blocks, Route9TextPointers, Route9Script ; blocks, texts, scripts
	db WEST | EAST ; connections
	WEST_MAP_CONNECTION CERULEAN_CITY, CERULEAN_CITY_WIDTH, -3, 1, CERULEAN_CITY_HEIGHT - 3, CeruleanCityBlocks, ROUTE_9_WIDTH
	EAST_MAP_CONNECTION ROUTE_10, ROUTE_10_WIDTH, 0, 0, ROUTE_10_HEIGHT - 24, Route10Blocks, ROUTE_9_WIDTH
	dw Route9Object ; objects
