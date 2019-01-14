Route20_h:
	db OVERWORLD ; tileset
	db ROUTE_20_HEIGHT, ROUTE_20_WIDTH ; dimensions (y, x)
	dw Route20_Blocks ; blocks
	dw Route20_TextPointers ; texts
	dw Route20_Script ; scripts
	db WEST | EAST ; connections
	WEST_MAP_CONNECTION ROUTE_20, CINNABAR_ISLAND, 0, 0, CinnabarIsland_Blocks
	EAST_MAP_CONNECTION ROUTE_20, ROUTE_19, -3, 15, Route19_Blocks
	dw Route20_Object ; objects
