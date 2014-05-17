ViridianForestExitObject: ; 0x5d598 (size=48)
	db $a ; border block

	db $4 ; warps
	db $0, $4, $1, $ff
	db $0, $5, $1, $ff
	db $7, $4, $0, VIRIDIAN_FOREST
	db $7, $5, $0, VIRIDIAN_FOREST

	db $0 ; signs

	db $2 ; people
	db SPRITE_BLACK_HAIR_BOY_2, $2 + 4, $3 + 4, $ff, $ff, $1 ; person
	db SPRITE_OLD_PERSON, $5 + 4, $2 + 4, $ff, $ff, $2 ; person

	; warp-to
	EVENT_DISP VIRIDIAN_FOREST_EXIT_WIDTH, $0, $4
	EVENT_DISP VIRIDIAN_FOREST_EXIT_WIDTH, $0, $5
	EVENT_DISP VIRIDIAN_FOREST_EXIT_WIDTH, $7, $4 ; VIRIDIAN_FOREST
	EVENT_DISP VIRIDIAN_FOREST_EXIT_WIDTH, $7, $5 ; VIRIDIAN_FOREST
