LavenderTown_h:
	db OVERWORLD ; tileset
	db LAVENDER_TOWN_HEIGHT, LAVENDER_TOWN_WIDTH ; dimensions (y, x)
	dw LavenderTown_Blocks ; blocks
	dw LavenderTown_TextPointers ; texts
	dw LavenderTown_Script ; scripts
	db NORTH | SOUTH | WEST ; connections
	NORTH_MAP_CONNECTION LAVENDER_TOWN, ROUTE_10, 0, 0, Route10_Blocks
	SOUTH_MAP_CONNECTION LAVENDER_TOWN, ROUTE_12, 0, 0, Route12_Blocks, 1
	WEST_MAP_CONNECTION LAVENDER_TOWN, ROUTE_8, 0, 0, Route8_Blocks
	dw LavenderTown_Object ; objects
