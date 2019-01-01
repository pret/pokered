Route7_h:
	db OVERWORLD ; tileset
	db ROUTE_7_HEIGHT, ROUTE_7_WIDTH ; dimensions (y, x)
	dw Route7_Blocks ; blocks
	dw Route7_TextPointers ; texts
	dw Route7_Script ; scripts
	db WEST | EAST ; connections
	WEST_MAP_CONNECTION ROUTE_7, CELADON_CITY, -3, 1, CeladonCity_Blocks
	EAST_MAP_CONNECTION ROUTE_7, SAFFRON_CITY, -3, 1, SaffronCity_Blocks, 1
	dw Route7_Object ; objects
