Route12_h:
	db OVERWORLD ; tileset
	db ROUTE_12_HEIGHT, ROUTE_12_WIDTH ; dimensions (y, x)
	dw Route12Blocks, Route12TextPointers, Route12Script ; blocks, texts, scripts
	db NORTH | SOUTH | WEST ; connections
	NORTH_MAP_CONNECTION ROUTE_12, LAVENDER_TOWN, 0, 0, LavenderTownBlocks
	SOUTH_MAP_CONNECTION ROUTE_12, ROUTE_13, -3, 17, Route13Blocks
	WEST_MAP_CONNECTION ROUTE_12, ROUTE_11, 27, 0, Route11Blocks
	dw Route12Object ; objects
