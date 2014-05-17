UndergroundPathEntranceRoute8_h: ; 0x1e27d to 0x1e289 (12 bytes) (bank=7) (id=80)
	db GATE ; tileset
	db PATH_ENTRANCE_ROUTE_8_HEIGHT, PATH_ENTRANCE_ROUTE_8_WIDTH ; dimensions (y, x)
	dw UndergroundPathEntranceRoute8Blocks, UndergroundPathEntranceRoute8TextPointers, UndergroundPathEntranceRoute8Script ; blocks, texts, scripts
	db $00 ; connections
	dw UndergroundPathEntranceRoute8Object ; objects
