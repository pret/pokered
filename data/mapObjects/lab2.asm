Lab2Object:
	db $17 ; border block

	db $2 ; warps
	db $7, $2, $2, CINNABAR_LAB_1
	db $7, $3, $2, CINNABAR_LAB_1

	db $0 ; signs

	db $3 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, $3, $2, STAY, DOWN, $1 ; person
	object SPRITE_OLD_PERSON, $1, $4, STAY, NONE, $2 ; person
	object SPRITE_FOULARD_WOMAN, $5, $5, STAY, UP, $3 ; person

	; warp-to
	EVENT_DISP CINNABAR_LAB_2_WIDTH, $7, $2 ; CINNABAR_LAB_1
	EVENT_DISP CINNABAR_LAB_2_WIDTH, $7, $3 ; CINNABAR_LAB_1
