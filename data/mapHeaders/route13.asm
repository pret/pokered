Route13_h: ; 0x5480c to 0x5482e (34 bytes) (id=24)
	db OVERWORLD ; tileset
	db ROUTE_13_HEIGHT, ROUTE_13_WIDTH ; dimensions (y, x)
	dw Route13Blocks, Route13TextPointers, Route13Script ; blocks, texts, scripts
	db NORTH | WEST ; connections
	NORTH_MAP_CONNECTION ROUTE_12, ROUTE_12_WIDTH, ROUTE_12_HEIGHT, 20, 0, ROUTE_12_WIDTH, Route12Blocks
	WEST_MAP_CONNECTION ROUTE_14, ROUTE_14_WIDTH, 0, 0, ROUTE_14_HEIGHT - 15, Route14Blocks, ROUTE_13_WIDTH
	dw Route13Object ; objects
