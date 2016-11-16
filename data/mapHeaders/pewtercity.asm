PewterCity_h:
	db OVERWORLD ; tileset
	db PEWTER_CITY_HEIGHT, PEWTER_CITY_WIDTH ; dimensions (y, x)
	dw PewterCityBlocks, PewterCityTextPointers, PewterCityScript ; blocks, texts, scripts
	db SOUTH | EAST ; connections
	SOUTH_MAP_CONNECTION PEWTER_CITY, ROUTE_2, 5, 0, Route2Blocks
	EAST_MAP_CONNECTION PEWTER_CITY, ROUTE_3, 4, 0, Route3Blocks
	dw PewterCityObject ; objects

	db $0
