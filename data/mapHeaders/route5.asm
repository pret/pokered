Route5_h: ; 0x54581 to 0x545a3 (34 bytes) (id=16)
	db OVERWORLD ; tileset
	db ROUTE_5_HEIGHT, ROUTE_5_WIDTH ; dimensions (y, x)
	dw Route5Blocks, Route5TextPointers, Route5Script ; blocks, texts, scripts
	db NORTH | SOUTH ; connections
	NORTH_MAP_CONNECTION CERULEAN_CITY, CERULEAN_CITY_WIDTH, CERULEAN_CITY_HEIGHT, -3, 2, CERULEAN_CITY_WIDTH - 4, CeruleanCityBlocks
	SOUTH_MAP_CONNECTION SAFFRON_CITY, SAFFRON_CITY_WIDTH, -3, 2, SAFFRON_CITY_WIDTH - 4, SaffronCityBlocks, ROUTE_5_WIDTH, ROUTE_5_HEIGHT
	dw Route5Object ; objects
