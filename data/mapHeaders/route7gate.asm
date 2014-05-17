Route7Gate_h: ; 0x1e0f4 to 0x1e100 (12 bytes) (bank=7) (id=76)
	db GATE ; tileset
	db ROUTE_7_GATE_HEIGHT, ROUTE_7_GATE_WIDTH ; dimensions (y, x)
	dw Route7GateBlocks, Route7GateTextPointers, Route7GateScript ; blocks, texts, scripts
	db $00 ; connections
	dw Route7GateObject ; objects
