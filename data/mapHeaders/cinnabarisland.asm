CinnabarIsland_h: ; 0x1c000 to 0x1c022 (34 bytes) (bank=7) (id=8)
	db OVERWORLD ; tileset
	db CINNABAR_ISLAND_HEIGHT, CINNABAR_ISLAND_WIDTH ; dimensions (y, x)
	dw CinnabarIslandBlocks, CinnabarIslandTextPointers, CinnabarIslandScript ; blocks, texts, scripts
	db NORTH | EAST ; connections
	NORTH_MAP_CONNECTION ROUTE_21, ROUTE_21_WIDTH, ROUTE_21_HEIGHT, 0, 0, ROUTE_21_WIDTH, Route21Blocks
	EAST_MAP_CONNECTION ROUTE_20, ROUTE_20_WIDTH, 0, 0, ROUTE_20_HEIGHT, Route20Blocks, CINNABAR_ISLAND_WIDTH
	dw CinnabarIslandObject ; objects
