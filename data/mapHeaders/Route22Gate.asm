Route22Gate_h:
	db GATE ; tileset
	db ROUTE_22_GATE_HEIGHT, ROUTE_22_GATE_WIDTH ; dimensions (y, x)
	dw Route22Gate_Blocks ; blocks
	dw Route22Gate_TextPointers ; texts
	dw Route22Gate_Script ; scripts
	db 0 ; connections
	dw Route22Gate_Object ; objects
