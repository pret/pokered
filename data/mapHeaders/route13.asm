Route13_h:
	db OVERWORLD ; tileset
	db ROUTE_13_HEIGHT, ROUTE_13_WIDTH ; dimensions (y, x)
	dw Route13Blocks, Route13TextPointers, Route13Script ; blocks, texts, scripts
	db NORTH | WEST ; connections
	NORTH_MAP_CONNECTION ROUTE_13, ROUTE_12, 20, 0, Route12Blocks
	WEST_MAP_CONNECTION ROUTE_13, ROUTE_14, 0, 0, Route14Blocks
	dw Route13Object ; objects
