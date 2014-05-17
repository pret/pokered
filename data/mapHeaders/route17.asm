Route17_h: ; 0x54b20 to 0x54b42 (34 bytes) (id=28)
	db OVERWORLD ; tileset
	db ROUTE_17_HEIGHT, ROUTE_17_WIDTH ; dimensions (y, x)
	dw Route17Blocks, Route17TextPointers, Route17Script ; blocks, texts, scripts
	db NORTH | SOUTH ; connections
	NORTH_MAP_CONNECTION ROUTE_16, ROUTE_16_WIDTH, ROUTE_16_HEIGHT, 0, 0, ROUTE_16_WIDTH - 7, Route16Blocks
	SOUTH_MAP_CONNECTION ROUTE_18, ROUTE_18_WIDTH, 0, 0, ROUTE_18_WIDTH - 12, Route18Blocks, ROUTE_17_WIDTH, ROUTE_17_HEIGHT
	dw Route17Object ; objects
