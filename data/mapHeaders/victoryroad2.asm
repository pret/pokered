VictoryRoad2_h: ; 0x51791 to 0x5179d (12 bytes) (id=194)
	db CAVERN ; tileset
	db VICTORY_ROAD_2_HEIGHT, VICTORY_ROAD_2_WIDTH ; dimensions (y, x)
	dw VictoryRoad2Blocks, VictoryRoad2TextPointers, VictoryRoad2Script ; blocks, texts, scripts
	db $00 ; connections
	dw VictoryRoad2Object ; objects
