LavenderTown_h: ; 0x44000 to 0x4402d (45 bytes) (bank=11) (id=4)
	db OVERWORLD ; tileset
	db LAVENDER_TOWN_HEIGHT, LAVENDER_TOWN_WIDTH ; dimensions (y, x)
	dw LavenderTownBlocks, LavenderTownTextPointers, LavenderTownScript ; blocks, texts, scripts
	db NORTH | SOUTH | WEST ; connections
	NORTH_MAP_CONNECTION LAVENDER_TOWN, ROUTE_10, 0, 0, Route10Blocks
	SOUTH_MAP_CONNECTION LAVENDER_TOWN, ROUTE_12, 0, 0, Route12Blocks, 1
	WEST_MAP_CONNECTION LAVENDER_TOWN, ROUTE_8, 0, 0, Route8Blocks
	dw LavenderTownObject ; objects
