Route3_h:
	db OVERWORLD ; tileset
	db ROUTE_3_HEIGHT, ROUTE_3_WIDTH ; dimensions (y, x)
	dw Route3_Blocks ; blocks
	dw Route3_TextPointers ; texts
	dw Route3_Script ; scripts
	db NORTH | WEST ; connections
	NORTH_MAP_CONNECTION ROUTE_3, ROUTE_4, 25, 0, Route4_Blocks
	WEST_MAP_CONNECTION ROUTE_3, PEWTER_CITY, -3, 1, PewterCity_Blocks
	dw Route3_Object ; objects
