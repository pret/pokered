Lab4Object:
	db $17 ; border block

	db $2 ; warps
	db $7, $2, $4, CINNABAR_LAB_1
	db $7, $3, $4, CINNABAR_LAB_1

	db $0 ; signs

	db $2 ; objects
	object SPRITE_OAK_AIDE, $5, $2, WALK, $2, $1 ; person
	object SPRITE_OAK_AIDE, $7, $6, STAY, UP, $2 ; person

	; warp-to
	EVENT_DISP CINNABAR_LAB_4_WIDTH, $7, $2 ; CINNABAR_LAB_1
	EVENT_DISP CINNABAR_LAB_4_WIDTH, $7, $3 ; CINNABAR_LAB_1
