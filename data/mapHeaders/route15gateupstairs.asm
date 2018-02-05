Route15GateUpstairs_h:
	db GATE ; tileset
	db ROUTE_15_GATE_2F_HEIGHT, ROUTE_15_GATE_2F_WIDTH ; dimensions (y, x)
	dw Route15GateUpstairsBlocks, Route15GateUpstairsTextPointers, Route15GateUpstairsScript ; blocks, texts, scripts
	db 0 ; connections
	dw Route15GateUpstairsObject ; objects
