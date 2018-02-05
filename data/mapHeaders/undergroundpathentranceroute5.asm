UndergroundPathEntranceRoute5_h:
	db GATE ; tileset
	db PATH_ENTRANCE_ROUTE_5_HEIGHT, PATH_ENTRANCE_ROUTE_5_WIDTH ; dimensions (y, x)
	dw UndergroundPathEntranceRoute5Blocks, UndergroundPathEntranceRoute5TextPointers, UndergroundPathEntranceRoute5Script ; blocks, texts, scripts
	db 0 ; connections
	dw UndergroundPathEntranceRoute5Object ; objects
