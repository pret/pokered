Route25_h:
	db OVERWORLD ; tileset
	db ROUTE_25_HEIGHT, ROUTE_25_WIDTH ; dimensions (y, x)
	dw Route25_Blocks ; blocks
	dw Route25_TextPointers ; texts
	dw Route25_Script ; scripts
	db WEST ; connections
	WEST_MAP_CONNECTION ROUTE_25, ROUTE_24, 0, 0, Route24_Blocks
	dw Route25_Object ; objects
