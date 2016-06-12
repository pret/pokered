VermilionHouse1_h:
	db HOUSE ; tileset
	db VERMILION_HOUSE_1_HEIGHT, VERMILION_HOUSE_1_WIDTH ; dimensions (y, x)
	dw VermilionHouse1Blocks, VermilionHouse1TextPointers, VermilionHouse1Script ; blocks, texts, scripts
	db $00 ; connections
	dw VermilionHouse1Object ; objects
