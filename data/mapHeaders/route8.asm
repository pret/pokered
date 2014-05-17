Route8_h: ; 0x5812d to 0x5814f (34 bytes) (id=19)
	db OVERWORLD ; tileset
	db ROUTE_8_HEIGHT, ROUTE_8_WIDTH ; dimensions (y, x)
	dw Route8Blocks, Route8TextPointers, Route8Script ; blocks, texts, scripts
	db WEST | EAST ; connections
	WEST_MAP_CONNECTION SAFFRON_CITY, SAFFRON_CITY_WIDTH, -3, 1, SAFFRON_CITY_HEIGHT - 3, SaffronCityBlocks, ROUTE_8_WIDTH
	EAST_MAP_CONNECTION LAVENDER_TOWN, LAVENDER_TOWN_WIDTH, 0, 0, LAVENDER_TOWN_HEIGHT, LavenderTownBlocks, ROUTE_8_WIDTH
	dw Route8Object ; objects
