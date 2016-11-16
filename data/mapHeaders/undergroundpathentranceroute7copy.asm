UndergroundPathEntranceRoute7Copy_h:
	db GATE ; tileset
	db PATH_ENTRANCE_ROUTE_7_HEIGHT, PATH_ENTRANCE_ROUTE_7_WIDTH ; dimensions (y, x)
	dw UndergroundPathEntranceRoute7CopyBlocks, UndergroundPathEntranceRoute7CopyTextPointers, UndergroundPathEntranceRoute7CopyScript ; blocks, texts, scripts
	db $00 ; connections
	dw UndergroundPathEntranceRoute7CopyObject ; objects
