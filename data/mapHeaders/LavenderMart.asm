LavenderMart_h:
	db MART ; tileset
	db LAVENDER_MART_HEIGHT, LAVENDER_MART_WIDTH ; dimensions (y, x)
	dw LavenderMart_Blocks ; blocks
	dw LavenderMart_TextPointers ; texts
	dw LavenderMart_Script ; scripts
	db 0 ; connections
	dw LavenderMart_Object ; objects
