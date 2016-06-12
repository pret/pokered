CeladonCity_h:
	db OVERWORLD ; tileset
	db CELADON_CITY_HEIGHT, CELADON_CITY_WIDTH ; dimensions (y, x)
	dw CeladonCityBlocks, CeladonCityTextPointers, CeladonCityScript ; blocks, texts, scripts
	db WEST | EAST ; connections
	WEST_MAP_CONNECTION CELADON_CITY, ROUTE_16, 4, 0, Route16Blocks
	EAST_MAP_CONNECTION CELADON_CITY, ROUTE_7, 4, 0, Route7Blocks, 1
	dw CeladonCityObject ; objects
