PalletTown_h: ; 182a1 (6:42a1)
	db OVERWORLD ; tileset
	db PALLET_TOWN_HEIGHT, PALLET_TOWN_WIDTH ; dimensions
	dw PalletTownBlocks, PalletTownTextPointers, PalletTownScript
	db NORTH | SOUTH ; connections
	NORTH_MAP_CONNECTION ROUTE_1, ROUTE_1_WIDTH, ROUTE_1_HEIGHT, 0, 0, ROUTE_1_WIDTH, Route1Blocks
	SOUTH_MAP_CONNECTION ROUTE_21, ROUTE_21_WIDTH, 0, 0, ROUTE_21_WIDTH, Route21Blocks, PALLET_TOWN_WIDTH, PALLET_TOWN_HEIGHT
	dw PalletTownObject
