Route11_h: ; 0x584be to 0x584e0 (34 bytes) (id=22)
	db OVERWORLD ; tileset
	db ROUTE_11_HEIGHT, ROUTE_11_WIDTH ; dimensions (y, x)
	dw Route11Blocks, Route11TextPointers, Route11Script ; blocks, texts, scripts
	db WEST | EAST ; connections
	WEST_MAP_CONNECTION VERMILION_CITY, VERMILION_CITY_WIDTH, -3, 1, VERMILION_CITY_HEIGHT - 3, VermilionCityBlocks, ROUTE_11_WIDTH
	EAST_MAP_CONNECTION ROUTE_12, ROUTE_12_WIDTH, -3, 24, ROUTE_12_HEIGHT - 39, Route12Blocks, ROUTE_11_WIDTH
	dw Route11Object ; objects
