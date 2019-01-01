Museum2F_h:
	db MUSEUM ; tileset
	db MUSEUM_2F_HEIGHT, MUSEUM_2F_WIDTH ; dimensions (y, x)
	dw Museum2F_Blocks ; blocks
	dw Museum2F_TextPointers ; texts
	dw Museum2F_Script ; scripts
	db 0 ; connections
	dw Museum2F_Object ; objects
