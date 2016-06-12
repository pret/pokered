CeladonMart2_h:
	db LOBBY ; tileset
	db CELADON_MART_2_HEIGHT, CELADON_MART_2_WIDTH ; dimensions (y, x)
	dw CeladonMart2Blocks, CeladonMart2TextPointers, CeladonMart2Script ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonMart2Object ; objects
