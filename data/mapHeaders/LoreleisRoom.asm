LoreleisRoom_h:
	db GYM ; tileset
	db LORELEIS_ROOM_HEIGHT, LORELEIS_ROOM_WIDTH ; dimensions (y, x)
	dw LoreleisRoom_Blocks ; blocks
	dw LoreleisRoom_TextPointers ; texts
	dw LoreleisRoom_Script ; scripts
	db 0 ; connections
	dw LoreleisRoom_Object ; objects
