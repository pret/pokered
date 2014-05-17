CeladonCity_h: ; 18000 (6:4000)
	db OVERWORLD ; tileset
	db CELADON_CITY_HEIGHT, CELADON_CITY_WIDTH ; dimensions (y, x)
	dw CeladonCityBlocks, CeladonCityTextPointers, CeladonCityScript ; blocks, texts, scripts
	db WEST | EAST ; connections
	WEST_MAP_CONNECTION ROUTE_16, ROUTE_16_WIDTH, 4, 0, ROUTE_16_HEIGHT, Route16Blocks, CELADON_CITY_WIDTH
	EAST_MAP_CONNECTION ROUTE_7, ROUTE_7_WIDTH, 4, 0, ROUTE_7_HEIGHT, Route7Blocks, CELADON_CITY_WIDTH
	dw CeladonCityObject ; objects
