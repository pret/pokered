LavenderPokecenter_h:
	db POKECENTER ; tileset
	db LAVENDER_POKECENTER_HEIGHT, LAVENDER_POKECENTER_WIDTH ; dimensions (y, x)
	dw LavenderPokecenter_Blocks ; blocks
	dw LavenderPokecenter_TextPointers ; texts
	dw LavenderPokecenter_Script ; scripts
	db 0 ; connections
	dw LavenderPokecenter_Object ; objects
