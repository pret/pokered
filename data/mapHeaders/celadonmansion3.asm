CeladonMansion3_h: ; 0x48784 to 0x48790 (12 bytes) (bank=12) (id=130)
	db MANSION ; tileset
	db CELADON_MANSION_3_HEIGHT, CELADON_MANSION_3_WIDTH ; dimensions (y, x)
	dw CeladonMansion3Blocks, CeladonMansion3TextPointers, CeladonMansion3Script ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonMansion3Object ; objects
