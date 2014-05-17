CeladonMart5_h: ; 0x4905d to 0x49069 (12 bytes) (bank=12) (id=136)
	db LOBBY ; tileset
	db CELADON_MART_5_HEIGHT, CELADON_MART_5_WIDTH ; dimensions (y, x)
	dw CeladonMart5Blocks, CeladonMart5TextPointers, CeladonMart5Script ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonMart5Object ; objects
