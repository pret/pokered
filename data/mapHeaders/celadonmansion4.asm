CeladonMansion4_h: ; 0x4885f to 0x4886b (12 bytes) (bank=12) (id=131)
	db MANSION ; tileset
	db CELADON_MANSION_4_HEIGHT, CELADON_MANSION_4_WIDTH ; dimensions (y, x)
	dw CeladonMansion4Blocks, CeladonMansion4TextPointers, CeladonMansion4Script ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonMansion4Object ; objects
