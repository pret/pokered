SaffronPokecenter_h:
	db POKECENTER ; tileset
	db SAFFRON_POKECENTER_HEIGHT, SAFFRON_POKECENTER_WIDTH ; dimensions (y, x)
	dw SaffronPokecenter_Blocks ; blocks
	dw SaffronPokecenter_TextPointers ; texts
	dw SaffronPokecenter_Script ; scripts
	db 0 ; connections
	dw SaffronPokecenter_Object ; objects
