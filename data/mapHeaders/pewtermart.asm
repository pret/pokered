PewterMart_h: ; 0x74ca1 to 0x74cad (12 bytes) (id=56)
	db MART ; tileset
	db PEWTER_MART_HEIGHT, PEWTER_MART_WIDTH ; dimensions (y, x)
	dw PewterMartBlocks, PewterMartTextPointers, PewterMartScript ; blocks, texts, scripts
	db $00 ; connections
	dw PewterMartObject ; objects
