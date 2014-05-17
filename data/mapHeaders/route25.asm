Route25_h: ; 0x5079b to 0x507b2 (23 bytes) (id=36)
	db OVERWORLD ; tileset
	db ROUTE_25_HEIGHT, ROUTE_25_WIDTH ; dimensions (y, x)
	dw Route25Blocks, Route25TextPointers, Route25Script ; blocks, texts, scripts
	db WEST ; connections
	WEST_MAP_CONNECTION ROUTE_24, ROUTE_24_WIDTH, 0, 0, ROUTE_24_HEIGHT - 6, Route24Blocks, ROUTE_25_WIDTH
	dw Route25Object ; objects
