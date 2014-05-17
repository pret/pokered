RocketHideout1_h: ; 0x44bbe to 0x44bca (12 bytes) (bank=11) (id=199)
	db FACILITY ; tileset
	db ROCKET_HIDEOUT_1_HEIGHT, ROCKET_HIDEOUT_1_WIDTH ; dimensions (y, x)
	dw RocketHideout1Blocks, RocketHideout1TextPointers, RocketHideout1Script ; blocks, texts, scripts
	db $00 ; connections
	dw RocketHideout1Object ; objects
