Colosseum_h:
	db CLUB ; tileset
	db COLOSSEUM_HEIGHT, COLOSSEUM_WIDTH ; dimensions (y, x)
	dw Colosseum_Blocks ; blocks
	dw Colosseum_TextPointers ; texts
	dw Colosseum_Script ; scripts
	db 0 ; connections
	dw Colosseum_Object ; objects
