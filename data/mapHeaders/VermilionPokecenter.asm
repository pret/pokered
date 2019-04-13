VermilionPokecenter_h:
	db POKECENTER ; tileset
	db VERMILION_POKECENTER_HEIGHT, VERMILION_POKECENTER_WIDTH ; dimensions (y, x)
	dw VermilionPokecenter_Blocks ; blocks
	dw VermilionPokecenter_TextPointers ; texts
	dw VermilionPokecenter_Script ; scripts
	db 0 ; connections
	dw VermilionPokecenter_Object ; objects
