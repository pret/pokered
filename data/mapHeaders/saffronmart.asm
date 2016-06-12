SaffronMart_h:
	db MART ; tileset
	db SAFFRON_MART_HEIGHT, SAFFRON_MART_WIDTH ; dimensions (y, x)
	dw SaffronMartBlocks, SaffronMartTextPointers, SaffronMartScript ; blocks, texts, scripts
	db $00 ; connections
	dw SaffronMartObject ; objects
