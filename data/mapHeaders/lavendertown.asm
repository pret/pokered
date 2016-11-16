LavenderTown_h:
	db OVERWORLD ; tileset
	db LAVENDER_TOWN_HEIGHT, LAVENDER_TOWN_WIDTH ; dimensions (y, x)
	dw LavenderTownBlocks, LavenderTownTextPointers, LavenderTownScript ; blocks, texts, scripts
	db NORTH | SOUTH | WEST ; connections
	NORTH_MAP_CONNECTION LAVENDER_TOWN, ROUTE_10, 0, 0, Route10Blocks
	SOUTH_MAP_CONNECTION LAVENDER_TOWN, ROUTE_12, 0, 0, Route12Blocks, 1
	WEST_MAP_CONNECTION LAVENDER_TOWN, ROUTE_8, 0, 0, Route8Blocks
	dw LavenderTownObject ; objects
