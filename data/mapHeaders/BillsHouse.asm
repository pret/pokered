BillsHouse_h:
	db INTERIOR ; tileset
	db BILLS_HOUSE_HEIGHT, BILLS_HOUSE_WIDTH ; dimensions (y, x)
	dw BillsHouse_Blocks ; blocks
	dw BillsHouse_TextPointers ; texts
	dw BillsHouse_Script ; scripts
	db 0 ; connections
	dw BillsHouse_Object ; objects
