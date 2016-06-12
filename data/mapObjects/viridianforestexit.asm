ViridianForestExitObject:
	db $a ; border block

	db $4 ; warps
	db $0, $4, $1, $ff
	db $0, $5, $1, $ff
	db $7, $4, $0, VIRIDIAN_FOREST
	db $7, $5, $0, VIRIDIAN_FOREST

	db $0 ; signs

	db $2 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, $3, $2, STAY, NONE, $1 ; person
	object SPRITE_OLD_PERSON, $2, $5, STAY, NONE, $2 ; person

	; warp-to
	EVENT_DISP VIRIDIAN_FOREST_EXIT_WIDTH, $0, $4
	EVENT_DISP VIRIDIAN_FOREST_EXIT_WIDTH, $0, $5
	EVENT_DISP VIRIDIAN_FOREST_EXIT_WIDTH, $7, $4 ; VIRIDIAN_FOREST
	EVENT_DISP VIRIDIAN_FOREST_EXIT_WIDTH, $7, $5 ; VIRIDIAN_FOREST
