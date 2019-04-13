UndergroundPathWestEast_h:
	db UNDERGROUND ; tileset
	db UNDERGROUND_PATH_WEST_EAST_HEIGHT, UNDERGROUND_PATH_WEST_EAST_WIDTH ; dimensions (y, x)
	dw UndergroundPathWestEast_Blocks ; blocks
	dw UndergroundPathWestEast_TextPointers ; texts
	dw UndergroundPathWestEast_Script ; scripts
	db 0 ; connections
	dw UndergroundPathWestEast_Object ; objects
