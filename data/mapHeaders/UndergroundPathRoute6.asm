UndergroundPathRoute6_h:
	db GATE ; tileset
	db UNDERGROUND_PATH_ROUTE_6_HEIGHT, UNDERGROUND_PATH_ROUTE_6_WIDTH ; dimensions (y, x)
	dw UndergroundPathRoute6_Blocks ; blocks
	dw UndergroundPathRoute6_TextPointers ; texts
	dw UndergroundPathRoute6_Script ; scripts
	db 0 ; connections
	dw UndergroundPathRoute6_Object ; objects
