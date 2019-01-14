Route2Gate_h:
	db GATE ; tileset
	db ROUTE_2_GATE_HEIGHT, ROUTE_2_GATE_WIDTH ; dimensions (y, x)
	dw Route2Gate_Blocks ; blocks
	dw Route2Gate_TextPointers ; texts
	dw Route2Gate_Script ; scripts
	db 0 ; connections
	dw Route2Gate_Object ; objects
