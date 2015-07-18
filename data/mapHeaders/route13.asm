Route13_h: ; 0x5480c to 0x5482e (34 bytes) (id=24)
	db OVERWORLD ; tileset
	db ROUTE_13_HEIGHT, ROUTE_13_WIDTH ; dimensions (y, x)
	dw Route13Blocks, Route13TextPointers, Route13Script ; blocks, texts, scripts
	db NORTH | WEST ; connections
	NORTH_MAP_CONNECTION ROUTE_13, ROUTE_12, 20, 0, Route12Blocks
	WEST_MAP_CONNECTION ROUTE_13, ROUTE_14, 0, 0, Route14Blocks
	dw Route13Object ; objects
