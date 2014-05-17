UnknownDungeon3_h: ; 0x45ee4 to 0x45ef0 (12 bytes) (bank=11) (id=227)
	db CAVERN ; tileset
	db UNKNOWN_DUNGEON_3_HEIGHT, UNKNOWN_DUNGEON_3_WIDTH ; dimensions (y, x)
	dw UnknownDungeon3Blocks, UnknownDungeon3TextPointers, UnknownDungeon3Script ; blocks, texts, scripts
	db $00 ; connections
	dw UnknownDungeon3Object ; objects
