SaffronCity_h:
	db OVERWORLD ; tileset
	db SAFFRON_CITY_HEIGHT, SAFFRON_CITY_WIDTH ; dimensions (y, x)
	dw SaffronCity_Blocks ; blocks
	dw SaffronCity_TextPointers ; texts
	dw SaffronCity_Script ; scripts
	db NORTH | SOUTH | WEST | EAST ; connections
	NORTH_MAP_CONNECTION SAFFRON_CITY, ROUTE_5, 5, 0, Route5_Blocks
	SOUTH_MAP_CONNECTION SAFFRON_CITY, ROUTE_6, 5, 0, Route6_Blocks, 1
	WEST_MAP_CONNECTION SAFFRON_CITY, ROUTE_7, 4, 0, Route7_Blocks
	EAST_MAP_CONNECTION SAFFRON_CITY, ROUTE_8, 4, 0, Route8_Blocks
	dw SaffronCity_Object ; objects
