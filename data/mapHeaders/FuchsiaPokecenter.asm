FuchsiaPokecenter_h:
	db POKECENTER ; tileset
	db FUCHSIA_POKECENTER_HEIGHT, FUCHSIA_POKECENTER_WIDTH ; dimensions (y, x)
	dw FuchsiaPokecenter_Blocks ; blocks
	dw FuchsiaPokecenter_TextPointers ; texts
	dw FuchsiaPokecenter_Script ; scripts
	db 0 ; connections
	dw FuchsiaPokecenter_Object ; objects
