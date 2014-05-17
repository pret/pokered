Route8Gate_h: ; 0x1e1bb to 0x1e1c7 (12 bytes) (bank=7) (id=79)
	db GATE ; tileset
	db ROUTE_8_GATE_HEIGHT, ROUTE_8_GATE_WIDTH ; dimensions (y, x)
	dw Route8GateBlocks, Route8GateTextPointers, Route8GateScript ; blocks, texts, scripts
	db $00 ; connections
	dw Route8GateObject ; objects
