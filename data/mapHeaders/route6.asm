Route6_h: ; 0x58000 to 0x58022 (34 bytes) (id=17)
	db OVERWORLD ; tileset
	db ROUTE_6_HEIGHT, ROUTE_6_WIDTH ; dimensions (y, x)
	dw Route6Blocks, Route6TextPointers, Route6Script ; blocks, texts, scripts
	db NORTH | SOUTH ; connections
	NORTH_MAP_CONNECTION ROUTE_6, SAFFRON_CITY, -3, 2, SaffronCityBlocks
	SOUTH_MAP_CONNECTION ROUTE_6, VERMILION_CITY, -3, 2, VermilionCityBlocks, 1
	dw Route6Object ; objects
