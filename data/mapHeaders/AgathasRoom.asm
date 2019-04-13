AgathasRoom_h:
	db CEMETERY ; tileset
	db AGATHAS_ROOM_HEIGHT, AGATHAS_ROOM_WIDTH ; dimensions (y, x)
	dw AgathasRoom_Blocks ; blocks
	dw AgathasRoom_TextPointers ; texts
	dw AgathasRoom_Script ; scripts
	db 0 ; connections
	dw AgathasRoom_Object ; objects
