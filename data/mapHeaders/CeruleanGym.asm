CeruleanGym_h:
	db GYM ; tileset
	db CERULEAN_GYM_HEIGHT, CERULEAN_GYM_WIDTH ; dimensions (y, x)
	dw CeruleanGym_Blocks ; blocks
	dw CeruleanGym_TextPointers ; texts
	dw CeruleanGym_Script ; scripts
	db 0 ; connections
	dw CeruleanGym_Object ; objects
