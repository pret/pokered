FuchsiaMart_h: ; 0x1dd7c to 0x1dd88 (12 bytes) (bank=7) (id=152)
	db MART ; tileset
	db FUCHSIA_MART_HEIGHT, FUCHSIA_MART_WIDTH ; dimensions (y, x)
	dw FuchsiaMartBlocks, FuchsiaMartTextPointers, FuchsiaMartScript ; blocks, texts, scripts
	db $00 ; connections
	dw FuchsiaMartObject ; objects
