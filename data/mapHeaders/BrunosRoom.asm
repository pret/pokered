BrunosRoom_h:
	db GYM ; tileset
	db BRUNOS_ROOM_HEIGHT, BRUNOS_ROOM_WIDTH ; dimensions (y, x)
	dw BrunosRoom_Blocks ; blocks
	dw BrunosRoom_TextPointers ; texts
	dw BrunosRoom_Script ; scripts
	db 0 ; connections
	dw BrunosRoom_Object ; objects
