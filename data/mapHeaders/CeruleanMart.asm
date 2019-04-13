CeruleanMart_h:
	db MART ; tileset
	db CERULEAN_MART_HEIGHT, CERULEAN_MART_WIDTH ; dimensions (y, x)
	dw CeruleanMart_Blocks ; blocks
	dw CeruleanMart_TextPointers ; texts
	dw CeruleanMart_Script ; scripts
	db 0 ; connections
	dw CeruleanMart_Object ; objects
