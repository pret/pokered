Route5Gate_h:
	db GATE ; tileset
	db ROUTE_5_GATE_HEIGHT, ROUTE_5_GATE_WIDTH ; dimensions (y, x)
	dw Route5GateBlocks, Route5GateTextPointers, Route5GateScript ; blocks, texts, scripts
	db $00 ; connections
	dw Route5GateObject ; objects
