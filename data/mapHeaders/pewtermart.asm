PewterMart_h:
	db MART ; tileset
	db PEWTER_MART_HEIGHT, PEWTER_MART_WIDTH ; dimensions (y, x)
	dw PewterMartBlocks, PewterMartTextPointers, PewterMartScript ; blocks, texts, scripts
	db $00 ; connections
	dw PewterMartObject ; objects
