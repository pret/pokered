UndergroundPathEntranceRoute5_h: ; 0x5d69d to 0x5d6a9 (12 bytes) (id=71)
	db GATE ; tileset
	db PATH_ENTRANCE_ROUTE_5_HEIGHT, PATH_ENTRANCE_ROUTE_5_WIDTH ; dimensions (y, x)
	dw UndergroundPathEntranceRoute5Blocks, UndergroundPathEntranceRoute5TextPointers, UndergroundPathEntranceRoute5Script ; blocks, texts, scripts
	db $00 ; connections
	dw UndergroundPathEntranceRoute5Object ; objects
