FightingDojo_h: ; 0x5cd51 to 0x5cd5d (12 bytes) (id=177)
	db DOJO ; tileset
	db FIGHTING_DOJO_HEIGHT, FIGHTING_DOJO_WIDTH ; dimensions (y, x)
	dw FightingDojoBlocks, FightingDojoTextPointers, FightingDojoScript ; blocks, texts, scripts
	db $00 ; connections
	dw FightingDojoObject ; objects
