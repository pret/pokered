VermilionCity_h:
	db OVERWORLD ; tileset
	db VERMILION_CITY_HEIGHT, VERMILION_CITY_WIDTH ; dimensions (y, x)
	dw VermilionCity_Blocks ; blocks
	dw VermilionCity_TextPointers ; texts
	dw VermilionCity_Script ; scripts
	db NORTH | EAST ; connections
	NORTH_MAP_CONNECTION VERMILION_CITY, ROUTE_6, 5, 0, Route6_Blocks
	EAST_MAP_CONNECTION VERMILION_CITY, ROUTE_11, 4, 0, Route11_Blocks
	dw VermilionCity_Object ; objects
