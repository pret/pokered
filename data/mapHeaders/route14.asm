Route14_h: ; 0x54999 to 0x549bb (34 bytes) (id=25)
	db OVERWORLD ; tileset
	db ROUTE_14_HEIGHT, ROUTE_14_WIDTH ; dimensions (y, x)
	dw Route14Blocks, Route14TextPointers, Route14Script ; blocks, texts, scripts
	db WEST | EAST ; connections
	WEST_MAP_CONNECTION ROUTE_15, ROUTE_15_WIDTH, 18, 0, ROUTE_15_HEIGHT, Route15Blocks, ROUTE_14_WIDTH
	EAST_MAP_CONNECTION ROUTE_13, ROUTE_13_WIDTH, 0, 0, ROUTE_13_HEIGHT, Route13Blocks, ROUTE_14_WIDTH
	dw Route14Object ; objects
