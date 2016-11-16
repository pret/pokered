Route16_h:
	db OVERWORLD ; tileset
	db ROUTE_16_HEIGHT, ROUTE_16_WIDTH ; dimensions (y, x)
	dw Route16Blocks, Route16TextPointers, Route16Script ; blocks, texts, scripts
	db SOUTH | EAST ; connections
	SOUTH_MAP_CONNECTION ROUTE_16, ROUTE_17, 0, 0, Route17Blocks
	EAST_MAP_CONNECTION ROUTE_16, CELADON_CITY, -3, 1, CeladonCityBlocks, 1
	dw Route16Object ; objects
