Route18_h: ; 0x58c38 to 0x58c5a (34 bytes) (id=29)
	db OVERWORLD ; tileset
	db ROUTE_18_HEIGHT, ROUTE_18_WIDTH ; dimensions (y, x)
	dw Route18Blocks, Route18TextPointers, Route18Script ; blocks, texts, scripts
	db NORTH | EAST ; connections
	NORTH_MAP_CONNECTION ROUTE_17, ROUTE_17_WIDTH, ROUTE_17_HEIGHT, 0, 0, ROUTE_17_WIDTH, Route17Blocks
	EAST_MAP_CONNECTION FUCHSIA_CITY, FUCHSIA_CITY_WIDTH, -3, 1, FUCHSIA_CITY_HEIGHT - 3, FuchsiaCityBlocks, ROUTE_18_WIDTH
	dw Route18Object ; objects
