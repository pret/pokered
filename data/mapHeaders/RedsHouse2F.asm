RedsHouse2F_h:
	db REDS_HOUSE_2 ; tileset
	db REDS_HOUSE_2F_HEIGHT, REDS_HOUSE_2F_WIDTH ; dimensions (y, x)
	dw RedsHouse2F_Blocks ; blocks
	dw RedsHouse2F_TextPointers ; texts
	dw RedsHouse2F_Script ; scripts
	db $00 ; connections
	dw RedsHouse2F_Object ; objects
