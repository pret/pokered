Route15Gate_h:
	db GATE ; tileset
	db ROUTE_15_GATE_1F_HEIGHT, ROUTE_15_GATE_1F_WIDTH ; dimensions (y, x)
	dw Route15GateBlocks, Route15GateTextPointers, Route15GateScript ; blocks, texts, scripts
	db 0 ; connections
	dw Route15GateObject ; objects
