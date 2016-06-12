FuchsiaMart_h:
	db MART ; tileset
	db FUCHSIA_MART_HEIGHT, FUCHSIA_MART_WIDTH ; dimensions (y, x)
	dw FuchsiaMartBlocks, FuchsiaMartTextPointers, FuchsiaMartScript ; blocks, texts, scripts
	db $00 ; connections
	dw FuchsiaMartObject ; objects
