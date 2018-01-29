Route12Gate_h:
	db GATE ; tileset
	db ROUTE_12_GATE_1F_HEIGHT, ROUTE_12_GATE_1F_WIDTH ; dimensions (y, x)
	dw Route12GateBlocks, Route12GateTextPointers, Route12GateScript ; blocks, texts, scripts
	db 0 ; connections
	dw Route12GateObject ; objects
