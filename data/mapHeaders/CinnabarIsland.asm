CinnabarIsland_h:
	db OVERWORLD ; tileset
	db CINNABAR_ISLAND_HEIGHT, CINNABAR_ISLAND_WIDTH ; dimensions (y, x)
	dw CinnabarIsland_Blocks ; blocks
	dw CinnabarIsland_TextPointers ; texts
	dw CinnabarIsland_Script ; scripts
	db NORTH | EAST ; connections
	NORTH_MAP_CONNECTION CINNABAR_ISLAND, ROUTE_21, 0, 0, Route21_Blocks
	EAST_MAP_CONNECTION CINNABAR_ISLAND, ROUTE_20, 0, 0, Route20_Blocks
	dw CinnabarIsland_Object ; objects
