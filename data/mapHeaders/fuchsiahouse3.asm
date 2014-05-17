FuchsiaHouse3_h: ; 0x56170 to 0x5617c (12 bytes) (id=164)
	db SHIP ; tileset
	db FUCHSIA_HOUSE_3_HEIGHT, FUCHSIA_HOUSE_3_WIDTH ; dimensions (y, x)
	dw FuchsiaHouse3Blocks, FuchsiaHouse3TextPointers, FuchsiaHouse3Script ; blocks, texts, scripts
	db $00 ; connections
	dw FuchsiaHouse3Object ; objects
