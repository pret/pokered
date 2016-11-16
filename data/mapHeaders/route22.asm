Route22_h:
	db OVERWORLD ; tileset
	db ROUTE_22_HEIGHT, ROUTE_22_WIDTH ; dimensions (y, x)
	dw Route22Blocks, Route22TextPointers, Route22Script ; blocks, texts, scripts
	db NORTH | EAST ; connections
	NORTH_MAP_CONNECTION ROUTE_22, ROUTE_23, 0, 0, Route23Blocks
	EAST_MAP_CONNECTION ROUTE_22, VIRIDIAN_CITY, -3, 1, ViridianCityBlocks, 1
	dw Route22Object ; objects
