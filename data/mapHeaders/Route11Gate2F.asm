Route11Gate2F_h:
	db GATE ; tileset
	db ROUTE_11_GATE_2F_HEIGHT, ROUTE_11_GATE_2F_WIDTH ; dimensions (y, x)
	dw Route11Gate2F_Blocks ; blocks
	dw Route11Gate2F_TextPointers ; texts
	dw Route11Gate2F_Script ; scripts
	db 0 ; connections
	dw Route11Gate2F_Object ; objects
