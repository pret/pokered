CeladonDiner_h:
	db LOBBY ; tileset
	db CELADON_DINER_HEIGHT, CELADON_DINER_WIDTH ; dimensions (y, x)
	dw CeladonDiner_Blocks ; blocks
	dw CeladonDiner_TextPointers ; texts
	dw CeladonDiner_Script ; scripts
	db 0 ; connections
	dw CeladonDiner_Object ; objects
