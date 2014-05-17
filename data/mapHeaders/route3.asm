Route3_h: ; 0x541e6 to 0x54208 (34 bytes) (id=14)
	db OVERWORLD ; tileset
	db ROUTE_3_HEIGHT, ROUTE_3_WIDTH ; dimensions (y, x)
	dw Route3Blocks, Route3TextPointers, Route3Script ; blocks, texts, scripts
	db NORTH | WEST ; connections
	NORTH_MAP_CONNECTION ROUTE_4, ROUTE_4_WIDTH, ROUTE_4_HEIGHT, 25, 0, ROUTE_4_WIDTH - 32, Route4Blocks
	WEST_MAP_CONNECTION PEWTER_CITY, PEWTER_CITY_WIDTH, -3, 1, PEWTER_CITY_HEIGHT - 3, PewterCityBlocks, ROUTE_3_WIDTH
	dw Route3Object ; objects
