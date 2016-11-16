VermilionHouse3_h:
	db HOUSE ; tileset
	db VERMILION_HOUSE_3_HEIGHT, VERMILION_HOUSE_3_WIDTH ; dimensions (y, x)
	dw VermilionHouse3Blocks, VermilionHouse3TextPointers, VermilionHouse3Script ; blocks, texts, scripts
	db $00 ; connections
	dw VermilionHouse3Object ; objects
