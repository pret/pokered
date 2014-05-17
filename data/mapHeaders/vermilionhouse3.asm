VermilionHouse3_h: ; 0x19c06 to 0x19c12 (12 bytes) (bank=6) (id=196)
	db HOUSE ; tileset
	db VERMILION_HOUSE_3_HEIGHT, VERMILION_HOUSE_3_WIDTH ; dimensions (y, x)
	dw VermilionHouse3Blocks, VermilionHouse3TextPointers, VermilionHouse3Script ; blocks, texts, scripts
	db $00 ; connections
	dw VermilionHouse3Object ; objects
