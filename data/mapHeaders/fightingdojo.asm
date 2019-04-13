FightingDojo_h:
	db DOJO ; tileset
	db FIGHTING_DOJO_HEIGHT, FIGHTING_DOJO_WIDTH ; dimensions (y, x)
	dw FightingDojoBlocks, FightingDojoTextPointers, FightingDojoScript ; blocks, texts, scripts
	db 0 ; connections
	dw FightingDojoObject ; objects
