CinnabarGym_h:
	db FACILITY ; tileset
	db CINNABAR_GYM_HEIGHT, CINNABAR_GYM_WIDTH ; dimensions (y, x)
	dw CinnabarGym_Blocks ; blocks
	dw CinnabarGym_TextPointers ; texts
	dw CinnabarGym_Script ; scripts
	db 0 ; connections
	dw CinnabarGym_Object ; objects
