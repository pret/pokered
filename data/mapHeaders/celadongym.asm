CeladonGym_h: ; 0x488fe to 0x4890a (12 bytes) (bank=12) (id=134)
	db GYM ; tileset
	db CELADON_GYM_HEIGHT, CELADON_GYM_WIDTH ; dimensions (y, x)
	dw CeladonGymBlocks, CeladonGymTextPointers, CeladonGymScript ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonGymObject ; objects
