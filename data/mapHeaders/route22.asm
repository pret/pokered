Route22_h: ; 0x50000 to 0x50022 (34 bytes) (id=33)
	db OVERWORLD ; tileset
	db ROUTE_22_HEIGHT, ROUTE_22_WIDTH ; dimensions (y, x)
	dw Route22Blocks, Route22TextPointers, Route22Script ; blocks, texts, scripts
	db NORTH | EAST ; connections
	NORTH_MAP_CONNECTION ROUTE_23, ROUTE_23_WIDTH, ROUTE_23_HEIGHT, 0, 0, ROUTE_23_WIDTH, Route23Blocks
	EAST_MAP_CONNECTION VIRIDIAN_CITY, VIRIDIAN_CITY_WIDTH, -3, 1, VIRIDIAN_CITY_HEIGHT - 3, ViridianCityBlocks, ROUTE_22_WIDTH
	dw Route22Object ; objects
