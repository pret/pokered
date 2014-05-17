RocketHideout4_h: ; 0x45451 to 0x4545d (12 bytes) (bank=11) (id=202)
	db FACILITY ; tileset
	db ROCKET_HIDEOUT_4_HEIGHT, ROCKET_HIDEOUT_4_WIDTH ; dimensions (y, x)
	dw RocketHideout4Blocks, RocketHideout4TextPointers, RocketHideout4Script ; blocks, texts, scripts
	db $00 ; connections
	dw RocketHideout4Object ; objects
