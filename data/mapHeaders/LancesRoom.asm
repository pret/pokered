LancesRoom_h:
	db DOJO ; tileset
	db LANCES_ROOM_HEIGHT, LANCES_ROOM_WIDTH ; dimensions (y, x)
	dw LancesRoom_Blocks ; blocks
	dw LancesRoom_TextPointers ; texts
	dw LancesRoom_Script ; scripts
	db 0 ; connections
	dw LancesRoom_Object ; objects
