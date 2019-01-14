UndergroundPathNorthSouth_h:
	db UNDERGROUND ; tileset
	db UNDERGROUND_PATH_NORTH_SOUTH_HEIGHT, UNDERGROUND_PATH_NORTH_SOUTH_WIDTH ; dimensions (y, x)
	dw UndergroundPathNorthSouth_Blocks ; blocks
	dw UndergroundPathNorthSouth_TextPointers ; texts
	dw UndergroundPathNorthSouth_Script ; scripts
	db 0 ; connections
	dw UndergroundPathNorthSouth_Object ; objects
