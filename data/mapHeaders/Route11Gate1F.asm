Route11Gate1F_h:
	db GATE ; tileset
	db ROUTE_11_GATE_1F_HEIGHT, ROUTE_11_GATE_1F_WIDTH ; dimensions (y, x)
	dw Route11Gate1F_Blocks ; blocks
	dw Route11Gate1F_TextPointers ; texts
	dw Route11Gate1F_Script ; scripts
	db 0 ; connections
	dw Route11Gate1F_Object ; objects
