CeladonGymObject: ; 0x48b30 (size=84)
	db $3 ; border block

	db $2 ; warps
	db $11, $4, $6, $ff
	db $11, $5, $6, $ff

	db $0 ; signs

	db $8 ; people
	db SPRITE_ERIKA, $3 + 4, $4 + 4, $ff, $d0, $41, ERIKA + $C8, $1 ; trainer
	db SPRITE_LASS, $b + 4, $2 + 4, $ff, $d3, $42, LASS + $C8, $11 ; trainer
	db SPRITE_FOULARD_WOMAN, $a + 4, $7 + 4, $ff, $d2, $43, BEAUTY + $C8, $1 ; trainer
	db SPRITE_LASS, $5 + 4, $9 + 4, $ff, $d0, $44, JR__TRAINER_F + $C8, $b ; trainer
	db SPRITE_FOULARD_WOMAN, $5 + 4, $1 + 4, $ff, $d0, $45, BEAUTY + $C8, $2 ; trainer
	db SPRITE_LASS, $3 + 4, $6 + 4, $ff, $d0, $46, LASS + $C8, $12 ; trainer
	db SPRITE_FOULARD_WOMAN, $3 + 4, $3 + 4, $ff, $d0, $47, BEAUTY + $C8, $3 ; trainer
	db SPRITE_LASS, $3 + 4, $5 + 4, $ff, $d0, $48, COOLTRAINER_F + $C8, $1 ; trainer

	; warp-to
	EVENT_DISP CELADON_GYM_WIDTH, $11, $4
	EVENT_DISP CELADON_GYM_WIDTH, $11, $5
