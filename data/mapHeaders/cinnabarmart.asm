CinnabarMart_h: ; 0x75e72 to 0x75e7e (12 bytes) (id=172)
	db MART ; tileset
	db CINNABAR_MART_HEIGHT, CINNABAR_MART_WIDTH ; dimensions (y, x)
	dw CinnabarMartBlocks, CinnabarMartTextPointers, CinnabarMartScript ; blocks, texts, scripts
	db $00 ; connections
	dw CinnabarMartObject ; objects
