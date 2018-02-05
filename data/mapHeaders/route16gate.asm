Route16Gate_h:
	db GATE ; tileset
	db ROUTE_16_GATE_1F_HEIGHT, ROUTE_16_GATE_1F_WIDTH ; dimensions (y, x)
	dw Route16GateBlocks, Route16GateTextPointers, Route16GateScript ; blocks, texts, scripts
	db 0 ; connections
	dw Route16GateObject ; objects
