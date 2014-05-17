UndergroundPathWE_h: ; 0x61f3e to 0x61f4a (12 bytes) (id=121)
	db UNDERGROUND ; tileset
	db UNDERGROUND_PATH_WE_HEIGHT, UNDERGROUND_PATH_WE_WIDTH ; dimensions (y, x)
	dw UndergroundPathWEBlocks, UndergroundPathWETextPointers, UndergroundPathWEScript ; blocks, texts, scripts
	db $00 ; connections
	dw UndergroundPathWEObject ; objects
