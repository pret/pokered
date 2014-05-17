Route15_h: ; 0x5892c to 0x5894e (34 bytes) (id=26)
	db OVERWORLD ; tileset
	db ROUTE_15_HEIGHT, ROUTE_15_WIDTH ; dimensions (y, x)
	dw Route15Blocks, Route15TextPointers, Route15Script ; blocks, texts, scripts
	db WEST | EAST ; connections
	WEST_MAP_CONNECTION FUCHSIA_CITY, FUCHSIA_CITY_WIDTH, -3, 1, FUCHSIA_CITY_HEIGHT - 3, FuchsiaCityBlocks, ROUTE_15_WIDTH
	EAST_MAP_CONNECTION ROUTE_14, ROUTE_14_WIDTH, -3, 15, ROUTE_14_HEIGHT - 15, Route14Blocks, ROUTE_15_WIDTH
	dw Route15Object ; objects
