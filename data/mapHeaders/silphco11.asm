SilphCo11_h:
	db INTERIOR ; tileset
	db SILPH_CO_11F_HEIGHT, SILPH_CO_11F_WIDTH ; dimensions (y, x)
	dw SilphCo11Blocks, SilphCo11TextPointers, SilphCo11Script ; blocks, texts, scripts
	db 0 ; connections
	dw SilphCo11Object ; objects
