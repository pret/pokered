SaffronMart_h: ; 0x5d3fd to 0x5d409 (12 bytes) (id=180)
	db MART ; tileset
	db SAFFRON_MART_HEIGHT, SAFFRON_MART_WIDTH ; dimensions (y, x)
	dw SaffronMartBlocks, SaffronMartTextPointers, SaffronMartScript ; blocks, texts, scripts
	db $00 ; connections
	dw SaffronMartObject ; objects
