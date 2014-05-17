Route12Gate_h: ; 0x494f8 to 0x49504 (12 bytes) (id=87)
	db GATE ; tileset
	db ROUTE_12_GATE_1F_HEIGHT, ROUTE_12_GATE_1F_WIDTH ; dimensions (y, x)
	dw Route12GateBlocks, Route12GateTextPointers, Route12GateScript ; blocks, texts, scripts
	db $00 ; connections
	dw Route12GateObject ; objects
