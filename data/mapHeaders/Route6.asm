Route6_h:
	db OVERWORLD ; tileset
	db ROUTE_6_HEIGHT, ROUTE_6_WIDTH ; dimensions (y, x)
	dw Route6_Blocks ; blocks
	dw Route6_TextPointers ; texts
	dw Route6_Script ; scripts
	db NORTH | SOUTH ; connections
	NORTH_MAP_CONNECTION ROUTE_6, SAFFRON_CITY, -3, 2, SaffronCity_Blocks
	SOUTH_MAP_CONNECTION ROUTE_6, VERMILION_CITY, -3, 2, VermilionCity_Blocks, 1
	dw Route6_Object ; objects
