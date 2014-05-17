UndergroundPathEntranceRoute6_h: ; 0x5d6e3 to 0x5d6ef (12 bytes) (id=74)
	db GATE ; tileset
	db PATH_ENTRANCE_ROUTE_6_HEIGHT, PATH_ENTRANCE_ROUTE_6_WIDTH ; dimensions (y, x)
	dw UndergroundPathEntranceRoute6Blocks, UndergroundPathEntranceRoute6TextPointers, UndergroundPathEntranceRoute6Script ; blocks, texts, scripts
	db $00 ; connections
	dw UndergroundPathEntranceRoute6Object ; objects
