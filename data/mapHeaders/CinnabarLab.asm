CinnabarLab_h:
	db LAB ; tileset
	db CINNABAR_LAB_HEIGHT, CINNABAR_LAB_WIDTH ; dimensions (y, x)
	dw CinnabarLab_Blocks ; blocks
	dw CinnabarLab_TextPointers ; texts
	dw CinnabarLab_Script ; scripts
	db 0 ; connections
	dw CinnabarLab_Object ; objects
