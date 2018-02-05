Route2Gate_h:
	db GATE ; tileset
	db ROUTE_2_GATE_HEIGHT, ROUTE_2_GATE_WIDTH ; dimensions (y, x)
	dw Route2GateBlocks, Route2GateTextPointers, Route2GateScript ; blocks, texts, scripts
	db 0 ; connections
	dw Route2GateObject ; objects
