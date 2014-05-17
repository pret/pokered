Route11GateUpstairs_h: ; 0x49448 to 0x49454 (12 bytes) (id=86)
	db GATE ; tileset
	db ROUTE_11_GATE_2F_HEIGHT, ROUTE_11_GATE_2F_WIDTH ; dimensions (y, x)
	dw Route11GateUpstairsBlocks, Route11GateUpstairsTextPointers, Route11GateUpstairsScript ; blocks, texts, scripts
	db $00 ; connections
	dw Route11GateUpstairsObject ; objects
