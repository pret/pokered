Route16Gate_h: ; 0x496b2 to 0x496be (12 bytes) (id=186)
	db GATE ; tileset
	db ROUTE_16_GATE_1F_HEIGHT, ROUTE_16_GATE_1F_WIDTH ; dimensions (y, x)
	dw Route16GateBlocks, Route16GateTextPointers, Route16GateScript ; blocks, texts, scripts
	db $00 ; connections
	dw Route16GateObject ; objects
