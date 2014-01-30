SaffronGymObject: ; 0x5d259 (size=330)
	db $2e ; border tile

	db $20 ; warps
	db $11, $8, $2, $ff
	db $11, $9, $2, $ff
	db $3, $1, $16, SAFFRON_GYM
	db $3, $5, $f, SAFFRON_GYM
	db $5, $1, $12, SAFFRON_GYM
	db $5, $5, $8, SAFFRON_GYM
	db $9, $1, $1b, SAFFRON_GYM
	db $9, $5, $10, SAFFRON_GYM
	db $b, $1, $5, SAFFRON_GYM
	db $b, $5, $d, SAFFRON_GYM
	db $f, $1, $17, SAFFRON_GYM
	db $f, $5, $1e, SAFFRON_GYM
	db $11, $1, $11, SAFFRON_GYM
	db $11, $5, $9, SAFFRON_GYM
	db $3, $9, $1a, SAFFRON_GYM
	db $3, $b, $3, SAFFRON_GYM
	db $5, $9, $7, SAFFRON_GYM
	db $5, $b, $c, SAFFRON_GYM
	db $b, $b, $4, SAFFRON_GYM
	db $f, $b, $1f, SAFFRON_GYM
	db $3, $f, $18, SAFFRON_GYM
	db $3, $13, $1c, SAFFRON_GYM
	db $5, $f, $2, SAFFRON_GYM
	db $5, $13, $a, SAFFRON_GYM
	db $9, $f, $14, SAFFRON_GYM
	db $9, $13, $1d, SAFFRON_GYM
	db $b, $f, $e, SAFFRON_GYM
	db $b, $13, $6, SAFFRON_GYM
	db $f, $f, $15, SAFFRON_GYM
	db $f, $13, $19, SAFFRON_GYM
	db $11, $f, $b, SAFFRON_GYM
	db $11, $13, $13, SAFFRON_GYM

	db $0 ; signs

	db $9 ; people
	db SPRITE_GIRL, $8 + 4, $9 + 4, $ff, $d0, $41, SABRINA + $C8, $1 ; trainer
	db SPRITE_MEDIUM, $1 + 4, $a + 4, $ff, $d0, $42, CHANNELER + $C8, $16 ; trainer
	db SPRITE_BUG_CATCHER, $1 + 4, $11 + 4, $ff, $d0, $43, PSYCHIC_TR + $C8, $1 ; trainer
	db SPRITE_MEDIUM, $7 + 4, $3 + 4, $ff, $d0, $44, CHANNELER + $C8, $17 ; trainer
	db SPRITE_BUG_CATCHER, $7 + 4, $11 + 4, $ff, $d0, $45, PSYCHIC_TR + $C8, $2 ; trainer
	db SPRITE_MEDIUM, $d + 4, $3 + 4, $ff, $d0, $46, CHANNELER + $C8, $18 ; trainer
	db SPRITE_BUG_CATCHER, $d + 4, $11 + 4, $ff, $d0, $47, PSYCHIC_TR + $C8, $3 ; trainer
	db SPRITE_BUG_CATCHER, $1 + 4, $3 + 4, $ff, $d0, $48, PSYCHIC_TR + $C8, $4 ; trainer
	db SPRITE_GYM_HELPER, $f + 4, $a + 4, $ff, $d0, $9 ; person

	; warp-to
	EVENT_DISP $a, $11, $8
	EVENT_DISP $a, $11, $9
	EVENT_DISP $a, $3, $1 ; SAFFRON_GYM
	EVENT_DISP $a, $3, $5 ; SAFFRON_GYM
	EVENT_DISP $a, $5, $1 ; SAFFRON_GYM
	EVENT_DISP $a, $5, $5 ; SAFFRON_GYM
	EVENT_DISP $a, $9, $1 ; SAFFRON_GYM
	EVENT_DISP $a, $9, $5 ; SAFFRON_GYM
	EVENT_DISP $a, $b, $1 ; SAFFRON_GYM
	EVENT_DISP $a, $b, $5 ; SAFFRON_GYM
	EVENT_DISP $a, $f, $1 ; SAFFRON_GYM
	EVENT_DISP $a, $f, $5 ; SAFFRON_GYM
	EVENT_DISP $a, $11, $1 ; SAFFRON_GYM
	EVENT_DISP $a, $11, $5 ; SAFFRON_GYM
	EVENT_DISP $a, $3, $9 ; SAFFRON_GYM
	EVENT_DISP $a, $3, $b ; SAFFRON_GYM
	EVENT_DISP $a, $5, $9 ; SAFFRON_GYM
	EVENT_DISP $a, $5, $b ; SAFFRON_GYM
	EVENT_DISP $a, $b, $b ; SAFFRON_GYM
	EVENT_DISP $a, $f, $b ; SAFFRON_GYM
	EVENT_DISP $a, $3, $f ; SAFFRON_GYM
	EVENT_DISP $a, $3, $13 ; SAFFRON_GYM
	EVENT_DISP $a, $5, $f ; SAFFRON_GYM
	EVENT_DISP $a, $5, $13 ; SAFFRON_GYM
	EVENT_DISP $a, $9, $f ; SAFFRON_GYM
	EVENT_DISP $a, $9, $13 ; SAFFRON_GYM
	EVENT_DISP $a, $b, $f ; SAFFRON_GYM
	EVENT_DISP $a, $b, $13 ; SAFFRON_GYM
	EVENT_DISP $a, $f, $f ; SAFFRON_GYM
	EVENT_DISP $a, $f, $13 ; SAFFRON_GYM
	EVENT_DISP $a, $11, $f ; SAFFRON_GYM
	EVENT_DISP $a, $11, $13 ; SAFFRON_GYM
