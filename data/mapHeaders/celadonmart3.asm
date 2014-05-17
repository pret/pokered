CeladonMart3_h: ; 0x48219 to 0x48225 (12 bytes) (bank=12) (id=124)
	db LOBBY ; tileset
	db CELADON_MART_3_HEIGHT, CELADON_MART_3_WIDTH ; dimensions (y, x)
	dw CeladonMart3Blocks, CeladonMart3TextPointers, CeladonMart3Script ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonMart3Object ; objects
