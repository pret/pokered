CeladonMansion5_h: ; 0x1dd2e to 0x1dd3a (12 bytes) (bank=7) (id=132)
	db HOUSE ; tileset
	db CELADON_MANSION_5_HEIGHT, CELADON_MANSION_5_WIDTH ; dimensions (y, x)
	dw CeladonMansion5Blocks, CeladonMansion5TextPointers, CeladonMansion5Script ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonMansion5Object ; objects
