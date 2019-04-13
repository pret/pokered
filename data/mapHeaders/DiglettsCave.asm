DiglettsCave_h:
	db CAVERN ; tileset
	db DIGLETTS_CAVE_HEIGHT, DIGLETTS_CAVE_WIDTH ; dimensions (y, x)
	dw DiglettsCave_Blocks ; blocks
	dw DiglettsCave_TextPointers ; texts
	dw DiglettsCave_Script ; scripts
	db 0 ; connections
	dw DiglettsCave_Object ; objects
