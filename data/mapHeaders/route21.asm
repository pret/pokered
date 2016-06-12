Route21_h:
	db OVERWORLD ; tileset
	db ROUTE_21_HEIGHT, ROUTE_21_WIDTH ; dimensions (y, x)
	dw Route21Blocks, Route21TextPointers, Route21Script ; blocks, texts, scripts
	db NORTH | SOUTH ; connections
	NORTH_MAP_CONNECTION ROUTE_21, PALLET_TOWN, 0, 0, PalletTownBlocks
	SOUTH_MAP_CONNECTION ROUTE_21, CINNABAR_ISLAND, 0, 0, CinnabarIslandBlocks, 1
	dw Route21Object ; objects
