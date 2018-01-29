Route18GateUpstairs_h:
	db GATE ; tileset
	db ROUTE_18_GATE_2F_HEIGHT, ROUTE_18_GATE_2F_WIDTH ; dimensions (y, x)
	dw Route18GateUpstairsBlocks, Route18GateUpstairsTextPointers, Route18GateUpstairsScript ; blocks, texts, scripts
	db 0 ; connections
	dw Route18GateUpstairsObject ; objects
