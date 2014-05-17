VermilionHouse1_h: ; 0x1daf0 to 0x1dafc (12 bytes) (bank=7) (id=93)
	db HOUSE ; tileset
	db VERMILION_HOUSE_1_HEIGHT, VERMILION_HOUSE_1_WIDTH ; dimensions (y, x)
	dw VermilionHouse1Blocks, VermilionHouse1TextPointers, VermilionHouse1Script ; blocks, texts, scripts
	db $00 ; connections
	dw VermilionHouse1Object ; objects
