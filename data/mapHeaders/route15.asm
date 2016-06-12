Route15_h:
	db OVERWORLD ; tileset
	db ROUTE_15_HEIGHT, ROUTE_15_WIDTH ; dimensions (y, x)
	dw Route15Blocks, Route15TextPointers, Route15Script ; blocks, texts, scripts
	db WEST | EAST ; connections
	WEST_MAP_CONNECTION ROUTE_15, FUCHSIA_CITY, -3, 1, FuchsiaCityBlocks
	EAST_MAP_CONNECTION ROUTE_15, ROUTE_14, -3, 15, Route14Blocks
	dw Route15Object ; objects
