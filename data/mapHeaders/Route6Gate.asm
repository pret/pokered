Route6Gate_h:
	db GATE ; tileset
	db ROUTE_6_GATE_HEIGHT, ROUTE_6_GATE_WIDTH ; dimensions (y, x)
	dw Route6Gate_Blocks ; blocks
	dw Route6Gate_TextPointers ; texts
	dw Route6Gate_Script ; scripts
	db 0 ; connections
	dw Route6Gate_Object ; objects
