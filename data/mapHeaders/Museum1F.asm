Museum1F_h:
	db MUSEUM ; tileset
	db MUSEUM_1F_HEIGHT, MUSEUM_1F_WIDTH ; dimensions (y, x)
	dw Museum1F_Blocks ; blocks
	dw Museum1F_TextPointers ; texts
	dw Museum1F_Script ; scripts
	db 0 ; connections
	dw Museum1F_Object ; objects
