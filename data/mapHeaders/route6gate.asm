Route6Gate_h: ; 0x1e031 to 0x1e03d (12 bytes) (bank=7) (id=73)
	db GATE ; tileset
	db ROUTE_6_GATE_HEIGHT, ROUTE_6_GATE_WIDTH ; dimensions (y, x)
	dw Route6GateBlocks, Route6GateTextPointers, Route6GateScript ; blocks, texts, scripts
	db $00 ; connections
	dw Route6GateObject ; objects
