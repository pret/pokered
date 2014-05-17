Route7_h: ; 0x48000 to 0x48022 (34 bytes) (bank=12) (id=18)
	db OVERWORLD ; tileset
	db ROUTE_7_HEIGHT, ROUTE_7_WIDTH ; dimensions (y, x)
	dw Route7Blocks, Route7TextPointers, Route7Script ; blocks, texts, scripts
	db WEST | EAST ; connections
	WEST_MAP_CONNECTION CELADON_CITY, CELADON_CITY_WIDTH, -3, 1, CELADON_CITY_HEIGHT - 3, CeladonCityBlocks, ROUTE_7_WIDTH
	EAST_MAP_CONNECTION SAFFRON_CITY, SAFFRON_CITY_WIDTH, -3, 1, SAFFRON_CITY_HEIGHT - 3, SaffronCityBlocks, ROUTE_7_WIDTH
	dw Route7Object ; objects
