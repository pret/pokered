OaksLab_h:
	db DOJO ; tileset
	db OAKS_LAB_HEIGHT, OAKS_LAB_WIDTH ; dimensions (y, x)
	dw OaksLab_Blocks ; blocks
	dw OaksLab_TextPointers ; texts
	dw OaksLab_Script ; scripts
	db 0 ; connections
	dw OaksLab_Object ; objects
