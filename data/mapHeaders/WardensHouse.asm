WardensHouse_h:
	db LAB ; tileset
	db WARDENS_HOUSE_HEIGHT, WARDENS_HOUSE_WIDTH ; dimensions (y, x)
	dw WardensHouse_Blocks ; blocks
	dw WardensHouse_TextPointers ; texts
	dw WardensHouse_Script ; scripts
	db 0 ; connections
	dw WardensHouse_Object ; objects
