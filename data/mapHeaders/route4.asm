Route4_h: ; 0x54390 to 0x543b2 (34 bytes) (id=15)
	db OVERWORLD ; tileset
	db ROUTE_4_HEIGHT, ROUTE_4_WIDTH ; dimensions (y, x)
	dw Route4Blocks, Route4TextPointers, Route4Script; blocks, texts, scripts
	db SOUTH | EAST ; connections
	SOUTH_MAP_CONNECTION ROUTE_3, ROUTE_3_WIDTH, -3, 22, ROUTE_3_WIDTH - 22, Route3Blocks, ROUTE_4_WIDTH, ROUTE_4_HEIGHT
	EAST_MAP_CONNECTION CERULEAN_CITY, CERULEAN_CITY_WIDTH, -3, 1, CERULEAN_CITY_HEIGHT - 3, CeruleanCityBlocks, ROUTE_4_WIDTH
	dw Route4Object ; objects
