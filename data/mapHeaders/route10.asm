Route10_h: ; 0x582d4 to 0x582f6 (34 bytes) (id=21)
	db OVERWORLD ; tileset
	db ROUTE_10_HEIGHT, ROUTE_10_WIDTH ; dimensions (y, x)
	dw Route10Blocks, Route10TextPointers, Route10Script ; blocks, texts, scripts
	db SOUTH | WEST ; connections
	SOUTH_MAP_CONNECTION LAVENDER_TOWN, LAVENDER_TOWN_WIDTH, 0, 0, LAVENDER_TOWN_WIDTH, LavenderTownBlocks, ROUTE_10_WIDTH, ROUTE_10_HEIGHT
	WEST_MAP_CONNECTION ROUTE_9, ROUTE_9_WIDTH, 0, 0, ROUTE_9_HEIGHT, Route9Blocks, ROUTE_10_WIDTH
	dw Route10Object ; objects
