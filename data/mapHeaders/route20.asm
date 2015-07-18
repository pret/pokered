Route20_h: ; 0x500f1 to 0x50113 (34 bytes) (id=31)
	db OVERWORLD ; tileset
	db ROUTE_20_HEIGHT, ROUTE_20_WIDTH ; dimensions (y, x)
	dw Route20Blocks, Route20TextPointers, Route20Script ; blocks, texts, scripts
	db WEST | EAST ; connections
	WEST_MAP_CONNECTION ROUTE_20, CINNABAR_ISLAND, 0, 0, CinnabarIslandBlocks
	EAST_MAP_CONNECTION ROUTE_20, ROUTE_19, -3, 15, Route19Blocks
	dw Route20Object ; objects
