Route6_h: ; 0x58000 to 0x58022 (34 bytes) (id=17)
	db OVERWORLD ; tileset
	db ROUTE_6_HEIGHT, ROUTE_6_WIDTH ; dimensions (y, x)
	dw Route6Blocks, Route6TextPointers, Route6Script ; blocks, texts, scripts
	db NORTH | SOUTH ; connections
	NORTH_MAP_CONNECTION SAFFRON_CITY, SAFFRON_CITY_WIDTH, SAFFRON_CITY_HEIGHT, -3, 2, SAFFRON_CITY_WIDTH - 4, SaffronCityBlocks
	SOUTH_MAP_CONNECTION VERMILION_CITY, VERMILION_CITY_WIDTH, -3, 2, VERMILION_CITY_WIDTH - 4, VermilionCityBlocks, ROUTE_6_WIDTH, ROUTE_6_HEIGHT
	dw Route6Object ; objects
