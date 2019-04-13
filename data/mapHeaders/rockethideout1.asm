RocketHideout1_h:
	db FACILITY ; tileset
	db ROCKET_HIDEOUT_1_HEIGHT, ROCKET_HIDEOUT_1_WIDTH ; dimensions (y, x)
	dw RocketHideout1Blocks, RocketHideout1TextPointers, RocketHideout1Script ; blocks, texts, scripts
	db 0 ; connections
	dw RocketHideout1Object ; objects
