UndergroundPathNS_h: ; 0x61f1a to 0x61f26 (12 bytes) (id=119)
	db UNDERGROUND ; tileset
	db UNDERGROUND_PATH_NS_HEIGHT, UNDERGROUND_PATH_NS_WIDTH ; dimensions (y, x)
	dw UndergroundPathNSBlocks, UndergroundPathNSTextPointers, UndergroundPathNSScript ; blocks, texts, scripts
	db $00 ; connections
	dw UndergroundPathNSObject ; objects
