Route12_h:
	db OVERWORLD ; tileset
	db ROUTE_12_HEIGHT, ROUTE_12_WIDTH ; dimensions (y, x)
	dw Route12_Blocks ; blocks
	dw Route12_TextPointers ; texts
	dw Route12_Script ; scripts
	db NORTH | SOUTH | WEST ; connections
	NORTH_MAP_CONNECTION ROUTE_12, LAVENDER_TOWN, 0, 0, LavenderTown_Blocks
	SOUTH_MAP_CONNECTION ROUTE_12, ROUTE_13, -3, 17, Route13_Blocks
	WEST_MAP_CONNECTION ROUTE_12, ROUTE_11, 27, 0, Route11_Blocks
	dw Route12_Object ; objects
