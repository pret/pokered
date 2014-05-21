PewterGymObject: ; 0x5c52e (size=42)
	db $3 ; border block

	db $2 ; warps
	db $d, $4, $2, $ff
	db $d, $5, $2, $ff

	db $0 ; signs

	db $3 ; people
	db SPRITE_BLACK_HAIR_BOY_2, $1 + 4, $4 + 4, $ff, $d0, TRAINER | $1, BROCK + $C8, $1
	db SPRITE_BLACK_HAIR_BOY_1, $6 + 4, $3 + 4, $ff, $d3, TRAINER | $2, JR__TRAINER_M + $C8, $1
	db SPRITE_GYM_HELPER, $a + 4, $7 + 4, $ff, $d0, $3 ; person

	; warp-to
	EVENT_DISP PEWTER_GYM_WIDTH, $d, $4
	EVENT_DISP PEWTER_GYM_WIDTH, $d, $5
