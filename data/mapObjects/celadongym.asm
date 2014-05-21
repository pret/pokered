CeladonGymObject: ; 0x48b30 (size=84)
	db $3 ; border block

	db $2 ; warps
	db $11, $4, $6, $ff
	db $11, $5, $6, $ff

	db $0 ; signs

	db $8 ; people
	db SPRITE_ERIKA, $3 + 4, $4 + 4, $ff, $d0, TRAINER | $1, ERIKA + $C8, $1
	db SPRITE_LASS, $b + 4, $2 + 4, $ff, $d3, TRAINER | $2, LASS + $C8, $11
	db SPRITE_FOULARD_WOMAN, $a + 4, $7 + 4, $ff, $d2, TRAINER | $3, BEAUTY + $C8, $1
	db SPRITE_LASS, $5 + 4, $9 + 4, $ff, $d0, TRAINER | $4, JR__TRAINER_F + $C8, $b
	db SPRITE_FOULARD_WOMAN, $5 + 4, $1 + 4, $ff, $d0, TRAINER | $5, BEAUTY + $C8, $2
	db SPRITE_LASS, $3 + 4, $6 + 4, $ff, $d0, TRAINER | $6, LASS + $C8, $12
	db SPRITE_FOULARD_WOMAN, $3 + 4, $3 + 4, $ff, $d0, TRAINER | $7, BEAUTY + $C8, $3
	db SPRITE_LASS, $3 + 4, $5 + 4, $ff, $d0, TRAINER | $8, COOLTRAINER_F + $C8, $1

	; warp-to
	EVENT_DISP CELADON_GYM_WIDTH, $11, $4
	EVENT_DISP CELADON_GYM_WIDTH, $11, $5
