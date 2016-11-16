IndigoPlateau_h:
	db PLATEAU ; tileset
	db INDIGO_PLATEAU_HEIGHT, INDIGO_PLATEAU_WIDTH ; dimensions (y, x)
	dw IndigoPlateauBlocks, IndigoPlateauTextPointers, IndigoPlateauScript ; blocks, texts, scripts
	db SOUTH ; connections
	SOUTH_MAP_CONNECTION INDIGO_PLATEAU, ROUTE_23, 0, 0, Route23Blocks
	dw IndigoPlateauObject ; objects
