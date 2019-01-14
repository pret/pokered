Route12Gate1F_h:
	db GATE ; tileset
	db ROUTE_12_GATE_1F_HEIGHT, ROUTE_12_GATE_1F_WIDTH ; dimensions (y, x)
	dw Route12Gate1F_Blocks ; blocks
	dw Route12Gate1F_TextPointers ; texts
	dw Route12Gate1F_Script ; scripts
	db 0 ; connections
	dw Route12Gate1F_Object ; objects
