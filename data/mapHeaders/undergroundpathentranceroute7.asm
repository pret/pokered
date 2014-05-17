UndergroundPathEntranceRoute7_h: ; 0x5d720 to 0x5d72c (12 bytes) (id=77)
	db GATE ; tileset
	db PATH_ENTRANCE_ROUTE_7_HEIGHT, PATH_ENTRANCE_ROUTE_7_WIDTH ; dimensions (y, x)
	dw UndergroundPathEntranceRoute7Blocks, UndergroundPathEntranceRoute7TextPointers, UndergroundPathEntranceRoute7Script ; blocks, texts, scripts
	db $00 ; connections
	dw UndergroundPathEntranceRoute7Object ; objects
