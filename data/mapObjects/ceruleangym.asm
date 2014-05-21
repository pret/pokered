CeruleanGymObject: ; 0x5c834 (size=50)
	db $3 ; border block

	db $2 ; warps
	db $d, $4, $3, $ff
	db $d, $5, $3, $ff

	db $0 ; signs

	db $4 ; people
	db SPRITE_BRUNETTE_GIRL, $2 + 4, $4 + 4, $ff, $d0, TRAINER | $1, MISTY + $C8, $1
	db SPRITE_LASS, $3 + 4, $2 + 4, $ff, $d3, TRAINER | $2, JR__TRAINER_F + $C8, $1
	db SPRITE_SWIMMER, $7 + 4, $8 + 4, $ff, $d2, TRAINER | $3, SWIMMER + $C8, $1
	db SPRITE_GYM_HELPER, $a + 4, $7 + 4, $ff, $d0, $4 ; person

	; warp-to
	EVENT_DISP CERULEAN_GYM_WIDTH, $d, $4
	EVENT_DISP CERULEAN_GYM_WIDTH, $d, $5
