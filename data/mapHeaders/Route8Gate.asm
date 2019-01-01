Route8Gate_h:
	db GATE ; tileset
	db ROUTE_8_GATE_HEIGHT, ROUTE_8_GATE_WIDTH ; dimensions (y, x)
	dw Route8Gate_Blocks ; blocks
	dw Route8Gate_TextPointers ; texts
	dw Route8Gate_Script ; scripts
	db 0 ; connections
	dw Route8Gate_Object ; objects
