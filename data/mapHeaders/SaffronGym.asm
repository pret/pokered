SaffronGym_h:
	db FACILITY ; tileset
	db SAFFRON_GYM_HEIGHT, SAFFRON_GYM_WIDTH ; dimensions (y, x)
	dw SaffronGym_Blocks ; blocks
	dw SaffronGym_TextPointers ; texts
	dw SaffronGym_Script ; scripts
	db 0 ; connections
	dw SaffronGym_Object ; objects
