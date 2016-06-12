UnknownDungeon1_h:
	db CAVERN ; tileset
	db UNKNOWN_DUNGEON_1_HEIGHT, UNKNOWN_DUNGEON_1_WIDTH ; dimensions (y, x)
	dw UnknownDungeon1Blocks, UnknownDungeon1TextPointers, UnknownDungeon1Script ; blocks, texts, scripts
	db $00 ; connections
	dw UnknownDungeon1Object ; objects
