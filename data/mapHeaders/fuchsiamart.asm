FuchsiaMart_h:
	db MART ; tileset
	db FUCHSIA_MART_HEIGHT, FUCHSIA_MART_WIDTH ; dimensions (y, x)
	dw FuchsiaMartBlocks, FuchsiaMartTextPointers, FuchsiaMartScript ; blocks, texts, scripts
	db 0 ; connections
	dw FuchsiaMartObject ; objects
