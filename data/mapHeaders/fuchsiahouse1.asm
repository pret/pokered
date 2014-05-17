FuchsiaHouse1_h: ; 0x7500c to 0x75018 (12 bytes) (id=153)
	db HOUSE ; tileset
	db FUCHSIA_HOUSE_1_HEIGHT, FUCHSIA_HOUSE_1_WIDTH ; dimensions (y, x)
	dw FuchsiaHouse1Blocks, FuchsiaHouse1TextPointers, FuchsiaHouse1Script ; blocks, texts, scripts
	db $00 ; connections
	dw FuchsiaHouse1Object ; objects
