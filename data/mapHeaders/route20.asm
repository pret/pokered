Route20_h: ; 0x500f1 to 0x50113 (34 bytes) (id=31)
	db OVERWORLD ; tileset
	db ROUTE_20_HEIGHT, ROUTE_20_WIDTH ; dimensions (y, x)
	dw Route20Blocks, Route20TextPointers, Route20Script ; blocks, texts, scripts
	db WEST | EAST ; connections
	WEST_MAP_CONNECTION CINNABAR_ISLAND, CINNABAR_ISLAND_WIDTH, 0, 0, CINNABAR_ISLAND_HEIGHT, CinnabarIslandBlocks, ROUTE_20_WIDTH
	EAST_MAP_CONNECTION ROUTE_19, ROUTE_19_WIDTH, -3, 15, ROUTE_19_HEIGHT - 15, Route19Blocks, ROUTE_20_WIDTH
	dw Route20Object ; objects
