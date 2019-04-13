Route22_h:
	db OVERWORLD ; tileset
	db ROUTE_22_HEIGHT, ROUTE_22_WIDTH ; dimensions (y, x)
	dw Route22_Blocks ; blocks
	dw Route22_TextPointers ; texts
	dw Route22_Script ; scripts
	db NORTH | EAST ; connections
	NORTH_MAP_CONNECTION ROUTE_22, ROUTE_23, 0, 0, Route23_Blocks
	EAST_MAP_CONNECTION ROUTE_22, VIRIDIAN_CITY, -3, 1, ViridianCity_Blocks, 1
	dw Route22_Object ; objects
