CeladonMansion1_h:
	db MANSION ; tileset
	db CELADON_MANSION_1_HEIGHT, CELADON_MANSION_1_WIDTH ; dimensions (y, x)
	dw CeladonMansion1Blocks, CeladonMansion1TextPointers, CeladonMansion1Script ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonMansion1Object ; objects
