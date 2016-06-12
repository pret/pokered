Route23_h:
	db PLATEAU ; tileset
	db ROUTE_23_HEIGHT, ROUTE_23_WIDTH ; dimensions (y, x)
	dw Route23Blocks, Route23TextPointers, Route23Script ; blocks, texts, scripts
	db NORTH | SOUTH ; connections
	NORTH_MAP_CONNECTION ROUTE_23, INDIGO_PLATEAU, 0, 0, IndigoPlateauBlocks
	SOUTH_MAP_CONNECTION ROUTE_23, ROUTE_22, 0, 0, Route22Blocks, 1
	dw Route23Object ; objects
