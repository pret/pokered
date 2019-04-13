CeruleanCity_h:
	db OVERWORLD ; tileset
	db CERULEAN_CITY_HEIGHT, CERULEAN_CITY_WIDTH ; dimensions (y, x)
	dw CeruleanCity_Blocks ; blocks
	dw CeruleanCity_TextPointers ; texts
	dw CeruleanCity_Script ; scripts
	db NORTH | SOUTH | WEST | EAST ; connections
	NORTH_MAP_CONNECTION CERULEAN_CITY, ROUTE_24, 5, 0, Route24_Blocks
	SOUTH_MAP_CONNECTION CERULEAN_CITY, ROUTE_5, 5, 0, Route5_Blocks, 1
	WEST_MAP_CONNECTION CERULEAN_CITY, ROUTE_4, 4, 0, Route4_Blocks
	EAST_MAP_CONNECTION CERULEAN_CITY, ROUTE_9, 4, 0, Route9_Blocks
	dw CeruleanCity_Object ; objects
