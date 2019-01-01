Route18_h:
	db OVERWORLD ; tileset
	db ROUTE_18_HEIGHT, ROUTE_18_WIDTH ; dimensions (y, x)
	dw Route18_Blocks ; blocks
	dw Route18_TextPointers ; texts
	dw Route18_Script ; scripts
	db NORTH | EAST ; connections
	NORTH_MAP_CONNECTION ROUTE_18, ROUTE_17, 0, 0, Route17_Blocks
	EAST_MAP_CONNECTION ROUTE_18, FUCHSIA_CITY, -3, 1, FuchsiaCity_Blocks, 1
	dw Route18_Object ; objects
