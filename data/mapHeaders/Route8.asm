Route8_h:
	db OVERWORLD ; tileset
	db ROUTE_8_HEIGHT, ROUTE_8_WIDTH ; dimensions (y, x)
	dw Route8_Blocks ; blocks
	dw Route8_TextPointers ; texts
	dw Route8_Script ; scripts
	db WEST | EAST ; connections
	WEST_MAP_CONNECTION ROUTE_8, SAFFRON_CITY, -3, 1, SaffronCity_Blocks
	EAST_MAP_CONNECTION ROUTE_8, LAVENDER_TOWN, 0, 0, LavenderTown_Blocks
	dw Route8_Object ; objects
