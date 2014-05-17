UnknownDungeon2_h: ; 0x45dff to 0x45e0b (12 bytes) (bank=11) (id=226)
	db CAVERN ; tileset
	db UNKNOWN_DUNGEON_2_HEIGHT, UNKNOWN_DUNGEON_2_WIDTH ; dimensions (y, x)
	dw UnknownDungeon2Blocks, UnknownDungeon2TextPointers, UnknownDungeon2Script ; blocks, texts, scripts
	db $00 ; connections
	dw UnknownDungeon2Object ; objects
