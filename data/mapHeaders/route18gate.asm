Route18Gate_h:
	db GATE ; tileset
	db ROUTE_18_GATE_1F_HEIGHT, ROUTE_18_GATE_1F_WIDTH ; dimensions (y, x)
	dw Route18GateBlocks, Route18GateTextPointers, Route18GateScript ; blocks, texts, scripts
	db $00 ; connections
	dw Route18GateObject ; objects
