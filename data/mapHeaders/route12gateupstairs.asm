Route12GateUpstairs_h: ; 0x49554 to 0x49560 (12 bytes) (id=195)
	db GATE ; tileset
	db ROUTE_12_GATE_2F_HEIGHT, ROUTE_12_GATE_2F_WIDTH ; dimensions (y, x)
	dw Route12GateUpstairsBlocks, Route12GateUpstairsTextPointers, Route12GateUpstairsScript ; blocks, texts, scripts
	db $00 ; connections
	dw Route12GateUpstairsObject ; objects
