Route14_h:
	db OVERWORLD ; tileset
	db ROUTE_14_HEIGHT, ROUTE_14_WIDTH ; dimensions (y, x)
	dw Route14_Blocks ; blocks
	dw Route14_TextPointers ; texts
	dw Route14_Script ; scripts
	db WEST | EAST ; connections
	WEST_MAP_CONNECTION ROUTE_14, ROUTE_15, 18, 0, Route15_Blocks
	EAST_MAP_CONNECTION ROUTE_14, ROUTE_13, 0, 0, Route13_Blocks
	dw Route14_Object ; objects
