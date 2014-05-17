IndigoPlateau_h: ; 0x5091e to 0x50935 (23 bytes) (id=9)
	db PLATEAU ; tileset
	db INDIGO_PLATEAU_HEIGHT, INDIGO_PLATEAU_WIDTH ; dimensions (y, x)
	dw IndigoPlateauBlocks, IndigoPlateauTextPointers, IndigoPlateauScript ; blocks, texts, scripts
	db SOUTH ; connections
	SOUTH_MAP_CONNECTION ROUTE_23, ROUTE_23_WIDTH, 0, 0, ROUTE_23_WIDTH, Route23Blocks, INDIGO_PLATEAU_WIDTH, INDIGO_PLATEAU_HEIGHT
	dw IndigoPlateauObject ; objects
