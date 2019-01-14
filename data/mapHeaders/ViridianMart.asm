ViridianMart_h:
	db MART ; tileset
	db VIRIDIAN_MART_HEIGHT, VIRIDIAN_MART_WIDTH ; dimensions (y, x)
	dw ViridianMart_Blocks ; blocks
	dw ViridianMart_TextPointers ; texts
	dw ViridianMart_Script ; scripts
	db 0 ; connections
	dw ViridianMart_Object ; objects
