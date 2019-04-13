Route12SuperRodHouse_h:
	db HOUSE ; tileset
	db ROUTE_12_SUPER_ROD_HOUSE_HEIGHT, ROUTE_12_SUPER_ROD_HOUSE_WIDTH ; dimensions (y, x)
	dw Route12SuperRodHouse_Blocks ; blocks
	dw Route12SuperRodHouse_TextPointers ; texts
	dw Route12SuperRodHouse_Script ; scripts
	db 0 ; connections
	dw Route12SuperRodHouse_Object ; objects
