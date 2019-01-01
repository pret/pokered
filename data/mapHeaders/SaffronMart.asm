SaffronMart_h:
	db MART ; tileset
	db SAFFRON_MART_HEIGHT, SAFFRON_MART_WIDTH ; dimensions (y, x)
	dw SaffronMart_Blocks ; blocks
	dw SaffronMart_TextPointers ; texts
	dw SaffronMart_Script ; scripts
	db 0 ; connections
	dw SaffronMart_Object ; objects
