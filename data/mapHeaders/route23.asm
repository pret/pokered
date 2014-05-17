Route23_h: ; 0x5033f to 0x50361 (34 bytes) (id=34)
	db PLATEAU ; tileset
	db ROUTE_23_HEIGHT, ROUTE_23_WIDTH ; dimensions (y, x)
	dw Route23Blocks, Route23TextPointers, Route23Script ; blocks, texts, scripts
	db NORTH | SOUTH ; connections
	NORTH_MAP_CONNECTION INDIGO_PLATEAU, INDIGO_PLATEAU_WIDTH, INDIGO_PLATEAU_HEIGHT, 0, 0, INDIGO_PLATEAU_WIDTH, IndigoPlateauBlocks
	SOUTH_MAP_CONNECTION ROUTE_22, ROUTE_22_WIDTH, 0, 0, ROUTE_22_WIDTH - 7, Route22Blocks, ROUTE_23_WIDTH, ROUTE_23_HEIGHT
	dw Route23Object ; objects
