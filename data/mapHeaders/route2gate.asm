Route2Gate_h: ; 0x5d5c8 to 0x5d5d4 (12 bytes) (id=49)
	db GATE ; tileset
	db ROUTE_2_GATE_HEIGHT, ROUTE_2_GATE_WIDTH ; dimensions (y, x)
	dw Route2GateBlocks, Route2GateTextPointers, Route2GateScript ; blocks, texts, scripts
	db $00 ; connections
	dw Route2GateObject ; objects
