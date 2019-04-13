UndergroundPathRoute7Copy_h:
	db GATE ; tileset
	db UNDERGROUND_PATH_ROUTE_7_HEIGHT, UNDERGROUND_PATH_ROUTE_7_WIDTH ; dimensions (y, x)
	dw UndergroundPathRoute7Copy_Blocks ; blocks
	dw UndergroundPathRoute7Copy_TextPointers ; texts
	dw UndergroundPathRoute7Copy_Script ; scripts
	db 0 ; connections
	dw UndergroundPathRoute7Copy_Object ; objects
