CeladonMansion4_h:
	db MANSION ; tileset
	db CELADON_MANSION_4_HEIGHT, CELADON_MANSION_4_WIDTH ; dimensions (y, x)
	dw CeladonMansion4Blocks, CeladonMansion4TextPointers, CeladonMansion4Script ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonMansion4Object ; objects
