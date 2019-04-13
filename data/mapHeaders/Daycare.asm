Daycare_h:
	db HOUSE ; tileset
	db DAYCARE_HEIGHT, DAYCARE_WIDTH ; dimensions (y, x)
	dw Daycare_Blocks ; blocks
	dw Daycare_TextPointers ; texts
	dw Daycare_Script ; scripts
	db 0 ; connections
	dw Daycare_Object ; objects
