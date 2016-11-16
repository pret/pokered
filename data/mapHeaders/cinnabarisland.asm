CinnabarIsland_h:
	db OVERWORLD ; tileset
	db CINNABAR_ISLAND_HEIGHT, CINNABAR_ISLAND_WIDTH ; dimensions (y, x)
	dw CinnabarIslandBlocks, CinnabarIslandTextPointers, CinnabarIslandScript ; blocks, texts, scripts
	db NORTH | EAST ; connections
	NORTH_MAP_CONNECTION CINNABAR_ISLAND, ROUTE_21, 0, 0, Route21Blocks
	EAST_MAP_CONNECTION CINNABAR_ISLAND, ROUTE_20, 0, 0, Route20Blocks
	dw CinnabarIslandObject ; objects
