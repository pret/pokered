Route21_h:
	db OVERWORLD ; tileset
	db ROUTE_21_HEIGHT, ROUTE_21_WIDTH ; dimensions (y, x)
	dw Route21_Blocks ; blocks
	dw Route21_TextPointers ; texts
	dw Route21_Script ; scripts
	db NORTH | SOUTH ; connections
	NORTH_MAP_CONNECTION ROUTE_21, PALLET_TOWN, 0, 0, PalletTown_Blocks
	SOUTH_MAP_CONNECTION ROUTE_21, CINNABAR_ISLAND, 0, 0, CinnabarIsland_Blocks, 1
	dw Route21_Object ; objects
