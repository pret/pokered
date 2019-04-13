IndigoPlateau_h:
	db PLATEAU ; tileset
	db INDIGO_PLATEAU_HEIGHT, INDIGO_PLATEAU_WIDTH ; dimensions (y, x)
	dw IndigoPlateau_Blocks ; blocks
	dw IndigoPlateau_TextPointers ; texts
	dw IndigoPlateau_Script ; scripts
	db SOUTH ; connections
	SOUTH_MAP_CONNECTION INDIGO_PLATEAU, ROUTE_23, 0, 0, Route23_Blocks
	dw IndigoPlateau_Object ; objects
