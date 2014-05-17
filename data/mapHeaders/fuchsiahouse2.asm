FuchsiaHouse2_h: ; 0x750a9 to 0x750b5 (12 bytes) (id=155)
	db LAB ; tileset
	db FUCHSIA_HOUSE_2_HEIGHT, FUCHSIA_HOUSE_2_WIDTH ; dimensions (y, x)
	dw FuchsiaHouse2Blocks, FuchsiaHouse2TextPointers, FuchsiaHouse2Script ; blocks, texts, scripts
	db $00 ; connections
	dw FuchsiaHouse2Object ; objects
