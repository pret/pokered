Route16_h: ; 0x58ada to 0x58afc (34 bytes) (id=27)
	db OVERWORLD ; tileset
	db ROUTE_16_HEIGHT, ROUTE_16_WIDTH ; dimensions (y, x)
	dw Route16Blocks, Route16TextPointers, Route16Script ; blocks, texts, scripts
	db SOUTH | EAST ; connections
	SOUTH_MAP_CONNECTION ROUTE_17, ROUTE_17_WIDTH, 0, 0, ROUTE_17_WIDTH, Route17Blocks, ROUTE_16_WIDTH, ROUTE_16_HEIGHT
	EAST_MAP_CONNECTION CELADON_CITY, CELADON_CITY_WIDTH, -3, 1, CELADON_CITY_HEIGHT - 3, CeladonCityBlocks, ROUTE_16_WIDTH
	dw Route16Object ; objects
