CinnabarGymObject: ; 0x75acc (size=90)
	db $2e ; border block

	db $2 ; warps
	db $11, $10, $1, $ff
	db $11, $11, $1, $ff

	db $0 ; signs

	db $9 ; people
	db SPRITE_FAT_BALD_GUY, $3 + 4, $3 + 4, $ff, $d0, $41, BLAINE + $C8, $1 ; trainer
	db SPRITE_BLACK_HAIR_BOY_2, $2 + 4, $11 + 4, $ff, $d0, $42, SUPER_NERD + $C8, $9 ; trainer
	db SPRITE_BLACK_HAIR_BOY_2, $8 + 4, $11 + 4, $ff, $d0, $43, BURGLAR + $C8, $4 ; trainer
	db SPRITE_BLACK_HAIR_BOY_2, $4 + 4, $b + 4, $ff, $d0, $44, SUPER_NERD + $C8, $a ; trainer
	db SPRITE_BLACK_HAIR_BOY_2, $8 + 4, $b + 4, $ff, $d0, $45, BURGLAR + $C8, $5 ; trainer
	db SPRITE_BLACK_HAIR_BOY_2, $e + 4, $b + 4, $ff, $d0, $46, SUPER_NERD + $C8, $b ; trainer
	db SPRITE_BLACK_HAIR_BOY_2, $e + 4, $3 + 4, $ff, $d0, $47, BURGLAR + $C8, $6 ; trainer
	db SPRITE_BLACK_HAIR_BOY_2, $8 + 4, $3 + 4, $ff, $d0, $48, SUPER_NERD + $C8, $c ; trainer
	db SPRITE_GYM_HELPER, $d + 4, $10 + 4, $ff, $d0, $9 ; person

	; warp-to
	EVENT_DISP CINNABAR_GYM_WIDTH, $11, $10
	EVENT_DISP CINNABAR_GYM_WIDTH, $11, $11
