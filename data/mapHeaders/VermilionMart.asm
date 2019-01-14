VermilionMart_h:
	db MART ; tileset
	db VERMILION_MART_HEIGHT, VERMILION_MART_WIDTH ; dimensions (y, x)
	dw VermilionMart_Blocks ; blocks
	dw VermilionMart_TextPointers ; texts
	dw VermilionMart_Script ; scripts
	db 0 ; connections
	dw VermilionMart_Object ; objects
