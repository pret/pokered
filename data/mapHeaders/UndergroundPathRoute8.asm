UndergroundPathRoute8_h:
	db GATE ; tileset
	db UNDERGROUND_PATH_ROUTE_8_HEIGHT, UNDERGROUND_PATH_ROUTE_8_WIDTH ; dimensions (y, x)
	dw UndergroundPathRoute8_Blocks ; blocks
	dw UndergroundPathRoute8_TextPointers ; texts
	dw UndergroundPathRoute8_Script ; scripts
	db 0 ; connections
	dw UndergroundPathRoute8_Object ; objects
