CeruleanMart_h:
	db MART ; tileset
	db CERULEAN_MART_HEIGHT, CERULEAN_MART_WIDTH ; dimensions (y, x)
	dw CeruleanMartBlocks, CeruleanMartTextPointers, CeruleanMartScript ; blocks, texts, scripts
	db $00 ; connections
	dw CeruleanMartObject ; objects
