VermilionGym_h:
	db GYM ; tileset
	db VERMILION_GYM_HEIGHT, VERMILION_GYM_WIDTH ; dimensions (y, x)
	dw VermilionGym_Blocks ; blocks
	dw VermilionGym_TextPointers ; texts
	dw VermilionGym_Script ; scripts
	db 0 ; connections
	dw VermilionGym_Object ; objects
