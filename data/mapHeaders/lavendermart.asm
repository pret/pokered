LavenderMart_h: ; 0x5c920 to 0x5c92c (12 bytes) (id=150)
	db MART ; tileset
	db LAVENDER_MART_HEIGHT, LAVENDER_MART_WIDTH ; dimensions (y, x)
	dw LavenderMartBlocks, LavenderMartTextPointers, LavenderMartScript ; blocks, texts, scripts
	db $00 ; connections
	dw LavenderMartObject ; objects
