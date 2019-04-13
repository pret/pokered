Route7Gate_h:
	db GATE ; tileset
	db ROUTE_7_GATE_HEIGHT, ROUTE_7_GATE_WIDTH ; dimensions (y, x)
	dw Route7Gate_Blocks ; blocks
	dw Route7Gate_TextPointers ; texts
	dw Route7Gate_Script ; scripts
	db 0 ; connections
	dw Route7Gate_Object ; objects
