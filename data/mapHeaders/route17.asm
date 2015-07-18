Route17_h: ; 0x54b20 to 0x54b42 (34 bytes) (id=28)
	db OVERWORLD ; tileset
	db ROUTE_17_HEIGHT, ROUTE_17_WIDTH ; dimensions (y, x)
	dw Route17Blocks, Route17TextPointers, Route17Script ; blocks, texts, scripts
	db NORTH | SOUTH ; connections
	NORTH_MAP_CONNECTION ROUTE_17, ROUTE_16, 0, 0, Route16Blocks
	SOUTH_MAP_CONNECTION ROUTE_17, ROUTE_18, 0, 0, Route18Blocks, 1
	dw Route17Object ; objects
