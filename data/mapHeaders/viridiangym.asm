ViridianGym_h: ; 0x74897 to 0x748a3 (12 bytes) (id=45)
	db GYM ; tileset
	db VIRIDIAN_GYM_HEIGHT, VIRIDIAN_GYM_WIDTH ; dimensions (y, x)
	dw ViridianGymBlocks, ViridianGymTextPointers, ViridianGymScript ; blocks, texts, scripts
	db $00 ; connections
	dw ViridianGymObject ; objects
