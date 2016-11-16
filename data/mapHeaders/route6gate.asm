Route6Gate_h:
	db GATE ; tileset
	db ROUTE_6_GATE_HEIGHT, ROUTE_6_GATE_WIDTH ; dimensions (y, x)
	dw Route6GateBlocks, Route6GateTextPointers, Route6GateScript ; blocks, texts, scripts
	db $00 ; connections
	dw Route6GateObject ; objects
