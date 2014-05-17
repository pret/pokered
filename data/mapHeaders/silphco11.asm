SilphCo11_h: ; 0x620ee to 0x620fa (12 bytes) (id=235)
	db INTERIOR ; tileset
	db SILPH_CO_11F_HEIGHT, SILPH_CO_11F_WIDTH ; dimensions (y, x)
	dw SilphCo11Blocks, SilphCo11TextPointers, SilphCo11Script ; blocks, texts, scripts
	db $00 ; connections
	dw SilphCo11Object ; objects
