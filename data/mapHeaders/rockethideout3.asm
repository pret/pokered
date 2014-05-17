RocketHideout3_h: ; 0x45219 to 0x45225 (12 bytes) (bank=11) (id=201)
	db FACILITY ; tileset
	db ROCKET_HIDEOUT_3_HEIGHT, ROCKET_HIDEOUT_3_WIDTH ; dimensions (y, x)
	dw RocketHideout3Blocks, RocketHideout3TextPointers, RocketHideout3Script ; blocks, texts, scripts
	db $00 ; connections
	dw RocketHideout3Object ; objects
