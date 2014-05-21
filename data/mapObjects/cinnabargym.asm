CinnabarGymObject: ; 0x75acc (size=90)
	db $2e ; border block

	db $2 ; warps
	db $11, $10, $1, $ff
	db $11, $11, $1, $ff

	db $0 ; signs

	db $9 ; people
	db SPRITE_FAT_BALD_GUY, $3 + 4, $3 + 4, $ff, $d0, TRAINER | $1, BLAINE + $C8, $1
	db SPRITE_BLACK_HAIR_BOY_2, $2 + 4, $11 + 4, $ff, $d0, TRAINER | $2, SUPER_NERD + $C8, $9
	db SPRITE_BLACK_HAIR_BOY_2, $8 + 4, $11 + 4, $ff, $d0, TRAINER | $3, BURGLAR + $C8, $4
	db SPRITE_BLACK_HAIR_BOY_2, $4 + 4, $b + 4, $ff, $d0, TRAINER | $4, SUPER_NERD + $C8, $a
	db SPRITE_BLACK_HAIR_BOY_2, $8 + 4, $b + 4, $ff, $d0, TRAINER | $5, BURGLAR + $C8, $5
	db SPRITE_BLACK_HAIR_BOY_2, $e + 4, $b + 4, $ff, $d0, TRAINER | $6, SUPER_NERD + $C8, $b
	db SPRITE_BLACK_HAIR_BOY_2, $e + 4, $3 + 4, $ff, $d0, TRAINER | $7, BURGLAR + $C8, $6
	db SPRITE_BLACK_HAIR_BOY_2, $8 + 4, $3 + 4, $ff, $d0, TRAINER | $8, SUPER_NERD + $C8, $c
	db SPRITE_GYM_HELPER, $d + 4, $10 + 4, $ff, $d0, $9 ; person

	; warp-to
	EVENT_DISP CINNABAR_GYM_WIDTH, $11, $10
	EVENT_DISP CINNABAR_GYM_WIDTH, $11, $11
