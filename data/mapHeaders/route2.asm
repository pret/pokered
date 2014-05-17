Route2_h: ; 54000 (15:4000)
	db 00 ; Tileset
	db ROUTE_2_HEIGHT,ROUTE_2_WIDTH ;Height,Width blocks (1 block = 4x4 tiles)
	dw Route2Blocks, Route2TextPointers, Route2Script
	db NORTH | SOUTH ;Connection Byte
	NORTH_MAP_CONNECTION PEWTER_CITY, PEWTER_CITY_WIDTH, PEWTER_CITY_HEIGHT, -3, 2, PEWTER_CITY_WIDTH - 4, PewterCityBlocks
	SOUTH_MAP_CONNECTION VIRIDIAN_CITY, VIRIDIAN_CITY_WIDTH, -3, 2, VIRIDIAN_CITY_WIDTH - 4, ViridianCityBlocks, ROUTE_2_WIDTH, ROUTE_2_HEIGHT
	dw Route2Object ;Object Data Pointer
