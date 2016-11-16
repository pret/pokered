VermilionCity_h:
	db OVERWORLD ; tileset
	db VERMILION_CITY_HEIGHT, VERMILION_CITY_WIDTH ; dimensions (y, x)
	dw VermilionCityBlocks, VermilionCityTextPointers, VermilionCityScript ; blocks, texts, scripts
	db NORTH | EAST ; connections
	NORTH_MAP_CONNECTION VERMILION_CITY, ROUTE_6, 5, 0, Route6Blocks
	EAST_MAP_CONNECTION VERMILION_CITY, ROUTE_11, 4, 0, Route11Blocks
	dw VermilionCityObject ; objects
