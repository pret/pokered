LavenderMart_h:
	db MART ; tileset
	db LAVENDER_MART_HEIGHT, LAVENDER_MART_WIDTH ; dimensions (y, x)
	dw LavenderMartBlocks, LavenderMartTextPointers, LavenderMartScript ; blocks, texts, scripts
	db 0 ; connections
	dw LavenderMartObject ; objects
