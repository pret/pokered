Route2_h:
	db OVERWORLD ; tileset
	db ROUTE_2_HEIGHT, ROUTE_2_WIDTH ; dimensions (y, x)
	dw Route2Blocks, Route2TextPointers, Route2Script ; blocks, texts, scripts
	db NORTH | SOUTH ; connections
	NORTH_MAP_CONNECTION ROUTE_2, PEWTER_CITY, -3, 2, PewterCityBlocks
	SOUTH_MAP_CONNECTION ROUTE_2, VIRIDIAN_CITY, -3, 2, ViridianCityBlocks, 1
	dw Route2Object ; objects
