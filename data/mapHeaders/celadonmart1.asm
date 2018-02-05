CeladonMart1_h:
	db LOBBY ; tileset
	db CELADON_MART_1_HEIGHT, CELADON_MART_1_WIDTH ; dimensions (y, x)
	dw CeladonMart1Blocks, CeladonMart1TextPointers, CeladonMart1Script ; blocks, texts, scripts
	db 0 ; connections
	dw CeladonMart1Object ; objects
