ViridianGym_h:
	db GYM ; tileset
	db VIRIDIAN_GYM_HEIGHT, VIRIDIAN_GYM_WIDTH ; dimensions (y, x)
	dw ViridianGym_Blocks ; blocks
	dw ViridianGym_TextPointers ; texts
	dw ViridianGym_Script ; scripts
	db 0 ; connections
	dw ViridianGym_Object ; objects
