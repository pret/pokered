HallOfFame_h:
	db GYM ; tileset
	db HALL_OF_FAME_HEIGHT, HALL_OF_FAME_WIDTH ; dimensions (y, x)
	dw HallOfFame_Blocks ; blocks
	dw HallOfFame_TextPointers ; texts
	dw HallOfFame_Script ; scripts
	db 0 ; connections
	dw HallOfFame_Object ; objects
