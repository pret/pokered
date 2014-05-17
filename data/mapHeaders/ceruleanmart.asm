CeruleanMart_h: ; 0x5c889 to 0x5c895 (12 bytes) (id=67)
	db MART ; tileset
	db CERULEAN_MART_HEIGHT, CERULEAN_MART_WIDTH ; dimensions (y, x)
	dw CeruleanMartBlocks, CeruleanMartTextPointers, CeruleanMartScript ; blocks, texts, scripts
	db $00 ; connections
	dw CeruleanMartObject ; objects
