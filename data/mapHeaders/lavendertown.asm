LavenderTown_h: ; 0x44000 to 0x4402d (45 bytes) (bank=11) (id=4)
	db OVERWORLD ; tileset
	db LAVENDER_TOWN_HEIGHT, LAVENDER_TOWN_WIDTH ; dimensions (y, x)
	dw LavenderTownBlocks, LavenderTownTextPointers, LavenderTownScript ; blocks, texts, scripts
	db NORTH | SOUTH | WEST ; connections
	NORTH_MAP_CONNECTION ROUTE_10, ROUTE_10_WIDTH, ROUTE_10_HEIGHT, 0, 0, ROUTE_10_WIDTH, Route10Blocks
	SOUTH_MAP_CONNECTION ROUTE_12, ROUTE_12_WIDTH, 0, 0, ROUTE_12_WIDTH, Route12Blocks, LAVENDER_TOWN_WIDTH, LAVENDER_TOWN_HEIGHT
	WEST_MAP_CONNECTION ROUTE_8, ROUTE_8_WIDTH, 0, 0, ROUTE_8_HEIGHT, Route8Blocks, LAVENDER_TOWN_WIDTH
	dw LavenderTownObject ; objects
