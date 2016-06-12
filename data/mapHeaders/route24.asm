Route24_h:
	db OVERWORLD ; tileset
	db ROUTE_24_HEIGHT, ROUTE_24_WIDTH ; dimensions (y, x)
	dw Route24Blocks, Route24TextPointers, Route24Script ; blocks, texts, scripts
	db SOUTH | EAST ; connections
	SOUTH_MAP_CONNECTION ROUTE_24, CERULEAN_CITY, -3, 2, CeruleanCityBlocks, 1
	EAST_MAP_CONNECTION ROUTE_24, ROUTE_25, 0, 0, Route25Blocks
	dw Route24Object ; objects
