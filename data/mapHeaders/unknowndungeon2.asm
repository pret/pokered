UnknownDungeon2_h:
	db CAVERN ; tileset
	db UNKNOWN_DUNGEON_2_HEIGHT, UNKNOWN_DUNGEON_2_WIDTH ; dimensions (y, x)
	dw UnknownDungeon2Blocks, UnknownDungeon2TextPointers, UnknownDungeon2Script ; blocks, texts, scripts
	db $00 ; connections
	dw UnknownDungeon2Object ; objects
