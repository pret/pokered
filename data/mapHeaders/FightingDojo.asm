FightingDojo_h:
	db DOJO ; tileset
	db FIGHTING_DOJO_HEIGHT, FIGHTING_DOJO_WIDTH ; dimensions (y, x)
	dw FightingDojo_Blocks ; blocks
	dw FightingDojo_TextPointers ; texts
	dw FightingDojo_Script ; scripts
	db 0 ; connections
	dw FightingDojo_Object ; objects
