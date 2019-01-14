Route18Gate2F_h:
	db GATE ; tileset
	db ROUTE_18_GATE_2F_HEIGHT, ROUTE_18_GATE_2F_WIDTH ; dimensions (y, x)
	dw Route18Gate2F_Blocks ; blocks
	dw Route18Gate2F_TextPointers ; texts
	dw Route18Gate2F_Script ; scripts
	db 0 ; connections
	dw Route18Gate2F_Object ; objects
