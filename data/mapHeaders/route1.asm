Route1_h: ; 0x1c0c3 to 0x1c0e5 (34 bytes) (bank=7) (id=12)
	db OVERWORLD ; tileset
	db ROUTE_1_HEIGHT, ROUTE_1_WIDTH ; dimensions (y, x)
	dw Route1Blocks, Route1TextPointers, Route1Script ; blocks, texts, scripts
	db NORTH | SOUTH ; connections
	NORTH_MAP_CONNECTION VIRIDIAN_CITY, VIRIDIAN_CITY_WIDTH, VIRIDIAN_CITY_HEIGHT, -3, 2, VIRIDIAN_CITY_WIDTH - 4, ViridianCityBlocks
	SOUTH_MAP_CONNECTION PALLET_TOWN, PALLET_TOWN_WIDTH, 0, 0, PALLET_TOWN_WIDTH, PalletTownBlocks, ROUTE_1_WIDTH, ROUTE_1_HEIGHT
	dw Route1Object ; objects
