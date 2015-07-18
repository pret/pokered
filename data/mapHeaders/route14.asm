Route14_h: ; 0x54999 to 0x549bb (34 bytes) (id=25)
	db OVERWORLD ; tileset
	db ROUTE_14_HEIGHT, ROUTE_14_WIDTH ; dimensions (y, x)
	dw Route14Blocks, Route14TextPointers, Route14Script ; blocks, texts, scripts
	db WEST | EAST ; connections
	WEST_MAP_CONNECTION ROUTE_14, ROUTE_15, 18, 0, Route15Blocks
	EAST_MAP_CONNECTION ROUTE_14, ROUTE_13, 0, 0, Route13Blocks
	dw Route14Object ; objects
