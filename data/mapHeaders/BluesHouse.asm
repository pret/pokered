BluesHouse_h:
	db HOUSE ; tileset
	db BLUES_HOUSE_HEIGHT, BLUES_HOUSE_WIDTH ; dimensions (y, x)
	dw BluesHouse_Blocks ; blocks
	dw BluesHouse_TextPointers ; texts
	dw BluesHouse_Script ; scripts
	db 0 ; connections
	dw BluesHouse_Object ; objects
