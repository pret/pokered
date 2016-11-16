CinnabarMart_h:
	db MART ; tileset
	db CINNABAR_MART_HEIGHT, CINNABAR_MART_WIDTH ; dimensions (y, x)
	dw CinnabarMartBlocks, CinnabarMartTextPointers, CinnabarMartScript ; blocks, texts, scripts
	db $00 ; connections
	dw CinnabarMartObject ; objects
