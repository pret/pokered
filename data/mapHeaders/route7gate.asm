Route7Gate_h:
	db GATE ; tileset
	db ROUTE_7_GATE_HEIGHT, ROUTE_7_GATE_WIDTH ; dimensions (y, x)
	dw Route7GateBlocks, Route7GateTextPointers, Route7GateScript ; blocks, texts, scripts
	db $00 ; connections
	dw Route7GateObject ; objects
