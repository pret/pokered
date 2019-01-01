PewterMart_h:
	db MART ; tileset
	db PEWTER_MART_HEIGHT, PEWTER_MART_WIDTH ; dimensions (y, x)
	dw PewterMart_Blocks ; blocks
	dw PewterMart_TextPointers ; texts
	dw PewterMart_Script ; scripts
	db 0 ; connections
	dw PewterMart_Object ; objects
