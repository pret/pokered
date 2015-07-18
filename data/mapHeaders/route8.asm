Route8_h: ; 0x5812d to 0x5814f (34 bytes) (id=19)
	db OVERWORLD ; tileset
	db ROUTE_8_HEIGHT, ROUTE_8_WIDTH ; dimensions (y, x)
	dw Route8Blocks, Route8TextPointers, Route8Script ; blocks, texts, scripts
	db WEST | EAST ; connections
	WEST_MAP_CONNECTION ROUTE_8, SAFFRON_CITY, -3, 1, SaffronCityBlocks
	EAST_MAP_CONNECTION ROUTE_8, LAVENDER_TOWN, 0, 0, LavenderTownBlocks
	dw Route8Object ; objects
