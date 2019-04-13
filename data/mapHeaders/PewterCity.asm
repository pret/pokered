PewterCity_h:
	db OVERWORLD ; tileset
	db PEWTER_CITY_HEIGHT, PEWTER_CITY_WIDTH ; dimensions (y, x)
	dw PewterCity_Blocks ; blocks
	dw PewterCity_TextPointers ; texts
	dw PewterCity_Script ; scripts
	db SOUTH | EAST ; connections
	SOUTH_MAP_CONNECTION PEWTER_CITY, ROUTE_2, 5, 0, Route2_Blocks
	EAST_MAP_CONNECTION PEWTER_CITY, ROUTE_3, 4, 0, Route3_Blocks
	dw PewterCity_Object ; objects
