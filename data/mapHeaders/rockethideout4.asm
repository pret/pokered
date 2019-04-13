RocketHideout4_h:
	db FACILITY ; tileset
	db ROCKET_HIDEOUT_4_HEIGHT, ROCKET_HIDEOUT_4_WIDTH ; dimensions (y, x)
	dw RocketHideout4Blocks, RocketHideout4TextPointers, RocketHideout4Script ; blocks, texts, scripts
	db 0 ; connections
	dw RocketHideout4Object ; objects
