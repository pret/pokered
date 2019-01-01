PewterPokecenter_h:
	db POKECENTER ; tileset
	db PEWTER_POKECENTER_HEIGHT, PEWTER_POKECENTER_WIDTH ; dimensions (y, x)
	dw PewterPokecenter_Blocks ; blocks
	dw PewterPokecenter_TextPointers ; texts
	dw PewterPokecenter_Script ; scripts
	db 0 ; connections
	dw PewterPokecenter_Object ; objects
