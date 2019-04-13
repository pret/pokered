Route16Gate1F_h:
	db GATE ; tileset
	db ROUTE_16_GATE_1F_HEIGHT, ROUTE_16_GATE_1F_WIDTH ; dimensions (y, x)
	dw Route16Gate1F_Blocks ; blocks
	dw Route16Gate1F_TextPointers ; texts
	dw Route16Gate1F_Script ; scripts
	db 0 ; connections
	dw Route16Gate1F_Object ; objects
