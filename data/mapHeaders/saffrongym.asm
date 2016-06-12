SaffronGym_h:
	db FACILITY ; tileset
	db SAFFRON_GYM_HEIGHT, SAFFRON_GYM_WIDTH ; dimensions (y, x)
	dw SaffronGymBlocks, SaffronGymTextPointers, SaffronGymScript ; blocks, texts, scripts
	db $00 ; connections
	dw SaffronGymObject ; objects
