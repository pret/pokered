CeladonMansion2_h: ; 0x4872e to 0x4873a (12 bytes) (bank=12) (id=129)
	db MANSION ; tileset
	db CELADON_MANSION_2_HEIGHT, CELADON_MANSION_2_WIDTH ; dimensions (y, x)
	dw CeladonMansion2Blocks, CeladonMansion2TextPointers, CeladonMansion2Script ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonMansion2Object ; objects
