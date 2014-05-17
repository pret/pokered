FuchsiaCity_h: ; 0x18ba7 to 0x18bd4 (45 bytes) (bank=6) (id=7)
	db OVERWORLD ; tileset
	db FUCHSIA_CITY_HEIGHT, FUCHSIA_CITY_WIDTH ; dimensions (y, x)
	dw FuchsiaCityBlocks, FuchsiaCityTextPointers, FuchsiaCityScript ; blocks, texts, scripts
	db SOUTH | WEST | EAST ; connections
	SOUTH_MAP_CONNECTION ROUTE_19, ROUTE_19_WIDTH, 5, 0, ROUTE_19_WIDTH, Route19Blocks, FUCHSIA_CITY_WIDTH, FUCHSIA_CITY_HEIGHT
	WEST_MAP_CONNECTION ROUTE_18, ROUTE_18_WIDTH, 4, 0, ROUTE_18_HEIGHT, Route18Blocks, FUCHSIA_CITY_WIDTH
	EAST_MAP_CONNECTION ROUTE_15, ROUTE_15_WIDTH, 4, 0, ROUTE_15_HEIGHT, Route15Blocks, FUCHSIA_CITY_WIDTH
	dw FuchsiaCityObject ; objects
