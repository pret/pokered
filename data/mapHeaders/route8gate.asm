Route8Gate_h:
	db GATE ; tileset
	db ROUTE_8_GATE_HEIGHT, ROUTE_8_GATE_WIDTH ; dimensions (y, x)
	dw Route8GateBlocks, Route8GateTextPointers, Route8GateScript ; blocks, texts, scripts
	db $00 ; connections
	dw Route8GateObject ; objects
