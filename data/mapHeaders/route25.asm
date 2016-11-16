Route25_h:
	db OVERWORLD ; tileset
	db ROUTE_25_HEIGHT, ROUTE_25_WIDTH ; dimensions (y, x)
	dw Route25Blocks, Route25TextPointers, Route25Script ; blocks, texts, scripts
	db WEST ; connections
	WEST_MAP_CONNECTION ROUTE_25, ROUTE_24, 0, 0, Route24Blocks
	dw Route25Object ; objects
