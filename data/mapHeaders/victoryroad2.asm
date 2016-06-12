VictoryRoad2_h:
	db CAVERN ; tileset
	db VICTORY_ROAD_2_HEIGHT, VICTORY_ROAD_2_WIDTH ; dimensions (y, x)
	dw VictoryRoad2Blocks, VictoryRoad2TextPointers, VictoryRoad2Script ; blocks, texts, scripts
	db $00 ; connections
	dw VictoryRoad2Object ; objects
