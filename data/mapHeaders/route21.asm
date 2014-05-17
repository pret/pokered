Route21_h: ; 0x54fff to 0x55021 (34 bytes) (id=32)
	db OVERWORLD ; tileset
	db ROUTE_21_HEIGHT, ROUTE_21_WIDTH ; dimensions (y, x)
	dw Route21Blocks, Route21TextPointers, Route21Script ; blocks, texts, scripts
	db NORTH | SOUTH ; connections
	NORTH_MAP_CONNECTION PALLET_TOWN, PALLET_TOWN_WIDTH, PALLET_TOWN_HEIGHT, 0, 0, PALLET_TOWN_WIDTH, PalletTownBlocks
	SOUTH_MAP_CONNECTION CINNABAR_ISLAND, CINNABAR_ISLAND_WIDTH, 0, 0, CINNABAR_ISLAND_WIDTH, CinnabarIslandBlocks, ROUTE_21_WIDTH, ROUTE_21_HEIGHT
	dw Route21Object ; objects
