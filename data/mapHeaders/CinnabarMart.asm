CinnabarMart_h:
	db MART ; tileset
	db CINNABAR_MART_HEIGHT, CINNABAR_MART_WIDTH ; dimensions (y, x)
	dw CinnabarMart_Blocks ; blocks
	dw CinnabarMart_TextPointers ; texts
	dw CinnabarMart_Script ; scripts
	db 0 ; connections
	dw CinnabarMart_Object ; objects
