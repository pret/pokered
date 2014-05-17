SaffronGym_h: ; 0x5d001 to 0x5d00d (12 bytes) (id=178)
	db FACILITY ; tileset
	db SAFFRON_GYM_HEIGHT, SAFFRON_GYM_WIDTH ; dimensions (y, x)
	dw SaffronGymBlocks, SaffronGymTextPointers, SaffronGymScript ; blocks, texts, scripts
	db $00 ; connections
	dw SaffronGymObject ; objects
