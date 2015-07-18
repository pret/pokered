Route18_h: ; 0x58c38 to 0x58c5a (34 bytes) (id=29)
	db OVERWORLD ; tileset
	db ROUTE_18_HEIGHT, ROUTE_18_WIDTH ; dimensions (y, x)
	dw Route18Blocks, Route18TextPointers, Route18Script ; blocks, texts, scripts
	db NORTH | EAST ; connections
	NORTH_MAP_CONNECTION ROUTE_18, ROUTE_17, 0, 0, Route17Blocks
	EAST_MAP_CONNECTION ROUTE_18, FUCHSIA_CITY, -3, 1, FuchsiaCityBlocks, 1
	dw Route18Object ; objects
