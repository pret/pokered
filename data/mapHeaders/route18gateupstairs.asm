Route18GateUpstairs_h: ; 0x49969 to 0x49975 (12 bytes) (id=191)
	db GATE ; tileset
	db ROUTE_18_GATE_2F_HEIGHT, ROUTE_18_GATE_2F_WIDTH ; dimensions (y, x)
	dw Route18GateUpstairsBlocks, Route18GateUpstairsTextPointers, Route18GateUpstairsScript ; blocks, texts, scripts
	db $00 ; connections
	dw Route18GateUpstairsObject ; objects
