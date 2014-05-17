Route22Gate_h: ; 0x1e677 to 0x1e683 (12 bytes) (bank=7) (id=193)
	db GATE ; tileset
	db ROUTE_22_GATE_HEIGHT, ROUTE_22_GATE_WIDTH ; dimensions (y, x)
	dw Route22GateBlocks, Route22GateTextPointers, Route22GateScript ; blocks, texts, scripts
	db $00 ; connections
	dw Route22GateObject ; objects
