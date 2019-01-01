CeladonCity_h:
	db OVERWORLD ; tileset
	db CELADON_CITY_HEIGHT, CELADON_CITY_WIDTH ; dimensions (y, x)
	dw CeladonCity_Blocks ; blocks
	dw CeladonCity_TextPointers ; texts
	dw CeladonCity_Script ; scripts
	db WEST | EAST ; connections
	WEST_MAP_CONNECTION CELADON_CITY, ROUTE_16, 4, 0, Route16_Blocks
	EAST_MAP_CONNECTION CELADON_CITY, ROUTE_7, 4, 0, Route7_Blocks, 1
	dw CeladonCity_Object ; objects
