CeladonMart2_h: ; 0x560e9 to 0x560f5 (12 bytes) (id=123)
	db LOBBY ; tileset
	db CELADON_MART_2_HEIGHT, CELADON_MART_2_WIDTH ; dimensions (y, x)
	dw CeladonMart2Blocks, CeladonMart2TextPointers, CeladonMart2Script ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonMart2Object ; objects
