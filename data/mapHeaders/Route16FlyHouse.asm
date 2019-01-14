Route16FlyHouse_h:
	db HOUSE ; tileset
	db ROUTE_16_FLY_HOUSE_HEIGHT, ROUTE_16_FLY_HOUSE_WIDTH ; dimensions (y, x)
	dw Route16FlyHouse_Blocks ; blocks
	dw Route16FlyHouse_TextPointers ; texts
	dw Route16FlyHouse_Script ; scripts
	db 0 ; connections
	dw Route16FlyHouse_Object ; objects
