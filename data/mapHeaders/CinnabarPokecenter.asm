CinnabarPokecenter_h:
	db POKECENTER ; tileset
	db CINNABAR_POKECENTER_HEIGHT, CINNABAR_POKECENTER_WIDTH ; dimensions (y, x)
	dw CinnabarPokecenter_Blocks ; blocks
	dw CinnabarPokecenter_TextPointers ; texts
	dw CinnabarPokecenter_Script ; scripts
	db 0 ; connections
	dw CinnabarPokecenter_Object ; objects
