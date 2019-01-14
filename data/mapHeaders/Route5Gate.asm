Route5Gate_h:
	db GATE ; tileset
	db ROUTE_5_GATE_HEIGHT, ROUTE_5_GATE_WIDTH ; dimensions (y, x)
	dw Route5Gate_Blocks ; blocks
	dw Route5Gate_TextPointers ; texts
	dw Route5Gate_Script ; scripts
	db 0 ; connections
	dw Route5Gate_Object ; objects
