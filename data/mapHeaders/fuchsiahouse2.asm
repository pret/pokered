FuchsiaHouse2_h:
	db LAB ; tileset
	db FUCHSIA_HOUSE_2_HEIGHT, FUCHSIA_HOUSE_2_WIDTH ; dimensions (y, x)
	dw FuchsiaHouse2Blocks, FuchsiaHouse2TextPointers, FuchsiaHouse2Script ; blocks, texts, scripts
	db 0 ; connections
	dw FuchsiaHouse2Object ; objects
