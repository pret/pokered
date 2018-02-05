Route22Gate_h:
	db GATE ; tileset
	db ROUTE_22_GATE_HEIGHT, ROUTE_22_GATE_WIDTH ; dimensions (y, x)
	dw Route22GateBlocks, Route22GateTextPointers, Route22GateScript ; blocks, texts, scripts
	db 0 ; connections
	dw Route22GateObject ; objects
