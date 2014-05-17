CeladonMart1_h: ; 0x60f7a to 0x60f86 (12 bytes) (id=122)
	db LOBBY ; tileset
	db CELADON_MART_1_HEIGHT, CELADON_MART_1_WIDTH ; dimensions (y, x)
	dw CeladonMart1Blocks, CeladonMart1TextPointers, CeladonMart1Script ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonMart1Object ; objects
