CinnabarMart_h:
	db MART ; tileset
	db CINNABAR_MART_HEIGHT, CINNABAR_MART_WIDTH ; dimensions (y, x)
	dw CinnabarMartBlocks, CinnabarMartTextPointers, CinnabarMartScript ; blocks, texts, scripts
	db 0 ; connections
	dw CinnabarMartObject ; objects
