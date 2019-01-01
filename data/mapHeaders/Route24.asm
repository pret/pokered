Route24_h:
	db OVERWORLD ; tileset
	db ROUTE_24_HEIGHT, ROUTE_24_WIDTH ; dimensions (y, x)
	dw Route24_Blocks ; blocks
	dw Route24_TextPointers ; texts
	dw Route24_Script ; scripts
	db SOUTH | EAST ; connections
	SOUTH_MAP_CONNECTION ROUTE_24, CERULEAN_CITY, -3, 2, CeruleanCity_Blocks, 1
	EAST_MAP_CONNECTION ROUTE_24, ROUTE_25, 0, 0, Route25_Blocks
	dw Route24_Object ; objects
