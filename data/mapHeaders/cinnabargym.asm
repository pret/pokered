CinnabarGym_h: ; 0x7573e to 0x7574a (12 bytes) (id=166)
	db FACILITY ; tileset
	db CINNABAR_GYM_HEIGHT, CINNABAR_GYM_WIDTH ; dimensions (y, x)
	dw CinnabarGymBlocks, CinnabarGymTextPointers, CinnabarGymScript ; blocks, texts, scripts
	db $00 ; connections
	dw CinnabarGymObject ; objects
