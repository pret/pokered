SaffronCity_h:
	db OVERWORLD ; tileset
	db SAFFRON_CITY_HEIGHT, SAFFRON_CITY_WIDTH ; dimensions (y, x)
	dw SaffronCityBlocks, SaffronCityTextPointers, SaffronCityScript ; blocks, texts, scripts
	db NORTH | SOUTH | WEST | EAST ; connections
	NORTH_MAP_CONNECTION SAFFRON_CITY, ROUTE_5, 5, 0, Route5Blocks
	SOUTH_MAP_CONNECTION SAFFRON_CITY, ROUTE_6, 5, 0, Route6Blocks, 1
	WEST_MAP_CONNECTION SAFFRON_CITY, ROUTE_7, 4, 0, Route7Blocks
	EAST_MAP_CONNECTION SAFFRON_CITY, ROUTE_8, 4, 0, Route8Blocks
	dw SaffronCityObject ; objects
