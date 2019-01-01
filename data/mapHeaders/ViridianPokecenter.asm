ViridianPokecenter_h:
	db POKECENTER ; tileset
	db VIRIDIAN_POKECENTER_HEIGHT, VIRIDIAN_POKECENTER_WIDTH ; dimensions (y, x)
	dw ViridianPokecenter_Blocks ; blocks
	dw ViridianPokecenter_TextPointers ; texts
	dw ViridianPokecenter_Script ; scripts
	db 0 ; connections
	dw ViridianPokecenter_Object ; objects
