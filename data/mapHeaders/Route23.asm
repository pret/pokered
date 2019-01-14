Route23_h:
	db PLATEAU ; tileset
	db ROUTE_23_HEIGHT, ROUTE_23_WIDTH ; dimensions (y, x)
	dw Route23_Blocks ; blocks
	dw Route23_TextPointers ; texts
	dw Route23_Script ; scripts
	db NORTH | SOUTH ; connections
	NORTH_MAP_CONNECTION ROUTE_23, INDIGO_PLATEAU, 0, 0, IndigoPlateau_Blocks
	SOUTH_MAP_CONNECTION ROUTE_23, ROUTE_22, 0, 0, Route22_Blocks, 1
	dw Route23_Object ; objects
