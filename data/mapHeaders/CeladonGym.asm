CeladonGym_h:
	db GYM ; tileset
	db CELADON_GYM_HEIGHT, CELADON_GYM_WIDTH ; dimensions (y, x)
	dw CeladonGym_Blocks ; blocks
	dw CeladonGym_TextPointers ; texts
	dw CeladonGym_Script ; scripts
	db 0 ; connections
	dw CeladonGym_Object ; objects
