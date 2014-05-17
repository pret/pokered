VermilionCity_h: ; 0x18998 to 0x189ba (34 bytes) (bank=6) (id=5)
	db OVERWORLD ; tileset
	db VERMILION_CITY_HEIGHT, VERMILION_CITY_WIDTH ; dimensions (y, x)
	dw VermilionCityBlocks, VermilionCityTextPointers, VermilionCityScript ; blocks, texts, scripts
	db NORTH | EAST ; connections
	NORTH_MAP_CONNECTION ROUTE_6, ROUTE_6_WIDTH, ROUTE_6_HEIGHT, 5, 0, ROUTE_6_WIDTH, Route6Blocks
	EAST_MAP_CONNECTION ROUTE_11, ROUTE_11_WIDTH, 4, 0, ROUTE_11_HEIGHT, Route11Blocks, VERMILION_CITY_WIDTH
	dw VermilionCityObject ; objects
