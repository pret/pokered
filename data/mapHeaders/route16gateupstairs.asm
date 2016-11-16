Route16GateUpstairs_h:
	db GATE ; tileset
	db ROUTE_16_GATE_2F_HEIGHT, ROUTE_16_GATE_2F_WIDTH ; dimensions (y, x)
	dw Route16GateUpstairsBlocks, Route16GateUpstairsTextPointers, Route16GateUpstairsScript ; blocks, texts, scripts
	db $00 ; connections
	dw Route16GateUpstairsObject ; objects
