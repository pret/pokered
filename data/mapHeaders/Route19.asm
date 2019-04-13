Route19_h:
	db OVERWORLD ; tileset
	db ROUTE_19_HEIGHT, ROUTE_19_WIDTH ; dimensions (y, x)
	dw Route19_Blocks ; blocks
	dw Route19_TextPointers ; texts
	dw Route19_Script ; scripts
	db NORTH | WEST ; connections
	NORTH_MAP_CONNECTION ROUTE_19, FUCHSIA_CITY, -3, 2, FuchsiaCity_Blocks
	WEST_MAP_CONNECTION ROUTE_19, ROUTE_20, 18, 0, Route20_Blocks
	dw Route19_Object ; objects
