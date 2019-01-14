GameCorner_h:
	db LOBBY ; tileset
	db GAME_CORNER_HEIGHT, GAME_CORNER_WIDTH ; dimensions (y, x)
	dw GameCorner_Blocks ; blocks
	dw GameCorner_TextPointers ; texts
	dw GameCorner_Script ; scripts
	db 0 ; connections
	dw GameCorner_Object ; objects
