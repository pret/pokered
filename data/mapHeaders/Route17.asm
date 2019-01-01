Route17_h:
	db OVERWORLD ; tileset
	db ROUTE_17_HEIGHT, ROUTE_17_WIDTH ; dimensions (y, x)
	dw Route17_Blocks ; blocks
	dw Route17_TextPointers ; texts
	dw Route17_Script ; scripts
	db NORTH | SOUTH ; connections
	NORTH_MAP_CONNECTION ROUTE_17, ROUTE_16, 0, 0, Route16_Blocks
	SOUTH_MAP_CONNECTION ROUTE_17, ROUTE_18, 0, 0, Route18_Blocks, 1
	dw Route17_Object ; objects
