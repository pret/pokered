Route19_h: ; 0x54e78 to 0x54e9a (34 bytes) (id=30)
	db OVERWORLD ; tileset
	db ROUTE_19_HEIGHT, ROUTE_19_WIDTH ; dimensions (y, x)
	dw Route19Blocks, Route19TextPointers, Route19Script ; blocks, texts, scripts
	db NORTH | WEST ; connections
	NORTH_MAP_CONNECTION FUCHSIA_CITY, FUCHSIA_CITY_WIDTH, FUCHSIA_CITY_HEIGHT, -3, 2, FUCHSIA_CITY_WIDTH - 4, FuchsiaCityBlocks
	WEST_MAP_CONNECTION ROUTE_20, ROUTE_20_WIDTH, 18, 0, ROUTE_20_HEIGHT, Route20Blocks, ROUTE_19_WIDTH
	dw Route19Object ; objects
