MtMoonPokecenter_h:
	db POKECENTER ; tileset
	db MT_MOON_POKECENTER_HEIGHT, MT_MOON_POKECENTER_WIDTH ; dimensions (y, x)
	dw MtMoonPokecenter_Blocks ; blocks
	dw MtMoonPokecenter_TextPointers ; texts
	dw MtMoonPokecenter_Script ; scripts
	db 0 ; connections
	dw MtMoonPokecenter_Object ; objects
