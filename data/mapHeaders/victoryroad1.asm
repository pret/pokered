VictoryRoad1_h: ; 0x5d9fe to 0x5da0a (12 bytes) (id=108)
	db CAVERN ; tileset
	db VICTORY_ROAD_1_HEIGHT, VICTORY_ROAD_1_WIDTH ; dimensions (y, x)
	dw VictoryRoad1Blocks, VictoryRoad1TextPointers, VictoryRoad1Script ; blocks, texts, scripts
	db $00 ; connections
	dw VictoryRoad1Object ; objects
