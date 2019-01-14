FuchsiaMart_h:
	db MART ; tileset
	db FUCHSIA_MART_HEIGHT, FUCHSIA_MART_WIDTH ; dimensions (y, x)
	dw FuchsiaMart_Blocks ; blocks
	dw FuchsiaMart_TextPointers ; texts
	dw FuchsiaMart_Script ; scripts
	db 0 ; connections
	dw FuchsiaMart_Object ; objects
