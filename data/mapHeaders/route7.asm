Route7_h:
	db OVERWORLD ; tileset
	db ROUTE_7_HEIGHT, ROUTE_7_WIDTH ; dimensions (y, x)
	dw Route7Blocks, Route7TextPointers, Route7Script ; blocks, texts, scripts
	db WEST | EAST ; connections
	WEST_MAP_CONNECTION ROUTE_7, CELADON_CITY, -3, 1, CeladonCityBlocks
	EAST_MAP_CONNECTION ROUTE_7, SAFFRON_CITY, -3, 1, SaffronCityBlocks, 1
	dw Route7Object ; objects
