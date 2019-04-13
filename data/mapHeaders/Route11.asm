Route11_h:
	db OVERWORLD ; tileset
	db ROUTE_11_HEIGHT, ROUTE_11_WIDTH ; dimensions (y, x)
	dw Route11_Blocks ; blocks
	dw Route11_TextPointers ; texts
	dw Route11_Script ; scripts
	db WEST | EAST ; connections
	WEST_MAP_CONNECTION ROUTE_11, VERMILION_CITY, -3, 1, VermilionCity_Blocks
	EAST_MAP_CONNECTION ROUTE_11, ROUTE_12, -3, 24, Route12_Blocks, 1
	dw Route11_Object ; objects
