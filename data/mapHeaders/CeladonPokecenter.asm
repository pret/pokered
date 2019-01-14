CeladonPokecenter_h:
	db POKECENTER ; tileset
	db CELADON_POKECENTER_HEIGHT, CELADON_POKECENTER_WIDTH ; dimensions (y, x)
	dw CeladonPokecenter_Blocks ; blocks
	dw CeladonPokecenter_TextPointers ; texts
	dw CeladonPokecenter_Script ; scripts
	db 0 ; connections
	dw CeladonPokecenter_Object ; objects
