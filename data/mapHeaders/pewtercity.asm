PewterCity_h: ; 0x18554 to 0x18576 (34 bytes) (bank=6) (id=2)
	db OVERWORLD ; tileset
	db PEWTER_CITY_HEIGHT, PEWTER_CITY_WIDTH ; dimensions (y, x)
	dw PewterCityBlocks, PewterCityTextPointers, PewterCityScript ; blocks, texts, scripts
	db SOUTH | EAST ; connections
	SOUTH_MAP_CONNECTION ROUTE_2, ROUTE_2_WIDTH, 5, 0, ROUTE_2_WIDTH, Route2Blocks, PEWTER_CITY_WIDTH, PEWTER_CITY_HEIGHT
	EAST_MAP_CONNECTION ROUTE_3, ROUTE_3_WIDTH, 4, 0, ROUTE_3_HEIGHT, Route3Blocks, PEWTER_CITY_WIDTH
	dw PewterCityObject ; objects

	db $0
