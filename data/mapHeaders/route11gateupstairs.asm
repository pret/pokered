Route11GateUpstairs_h:
	db GATE ; tileset
	db ROUTE_11_GATE_2F_HEIGHT, ROUTE_11_GATE_2F_WIDTH ; dimensions (y, x)
	dw Route11GateUpstairsBlocks, Route11GateUpstairsTextPointers, Route11GateUpstairsScript ; blocks, texts, scripts
	db 0 ; connections
	dw Route11GateUpstairsObject ; objects
