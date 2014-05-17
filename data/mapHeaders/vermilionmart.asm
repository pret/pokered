VermilionMart_h: ; 0x5c9d5 to 0x5c9e1 (12 bytes) (id=91)
	db MART ; tileset
	db VERMILION_MART_HEIGHT, VERMILION_MART_WIDTH ; dimensions (y, x)
	dw VermilionMartBlocks, VermilionMartTextPointers, VermilionMartScript ; blocks, texts, scripts
	db $00 ; connections
	dw VermilionMartObject ; objects
