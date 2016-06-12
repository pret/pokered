Route11Gate_h:
	db GATE ; tileset
	db ROUTE_11_GATE_1F_HEIGHT, ROUTE_11_GATE_1F_WIDTH ; dimensions (y, x)
	dw Route11GateBlocks, Route11GateTextPointers, Route11GateScript ; blocks, texts, scripts
	db $00 ; connections
	dw Route11GateObject ; objects
