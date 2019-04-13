CeruleanPokecenter_h:
	db POKECENTER ; tileset
	db CERULEAN_POKECENTER_HEIGHT, CERULEAN_POKECENTER_WIDTH ; dimensions (y, x)
	dw CeruleanPokecenter_Blocks ; blocks
	dw CeruleanPokecenter_TextPointers ; texts
	dw CeruleanPokecenter_Script ; scripts
	db 0 ; connections
	dw CeruleanPokecenter_Object ; objects
