FuchsiaGym_h:
	db GYM ; tileset
	db FUCHSIA_GYM_HEIGHT, FUCHSIA_GYM_WIDTH ; dimensions (y, x)
	dw FuchsiaGym_Blocks ; blocks
	dw FuchsiaGym_TextPointers ; texts
	dw FuchsiaGym_Script ; scripts
	db 0 ; connections
	dw FuchsiaGym_Object ; objects
