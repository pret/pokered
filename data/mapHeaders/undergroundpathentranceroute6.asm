UndergroundPathEntranceRoute6_h:
	db GATE ; tileset
	db PATH_ENTRANCE_ROUTE_6_HEIGHT, PATH_ENTRANCE_ROUTE_6_WIDTH ; dimensions (y, x)
	dw UndergroundPathEntranceRoute6Blocks, UndergroundPathEntranceRoute6TextPointers, UndergroundPathEntranceRoute6Script ; blocks, texts, scripts
	db $00 ; connections
	dw UndergroundPathEntranceRoute6Object ; objects
