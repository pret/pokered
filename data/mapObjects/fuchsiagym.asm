FuchsiaGymObject: ; 0x75658 (size=82)
	db $3 ; border block

	db $2 ; warps
	db $11, $4, $5, $ff
	db $11, $5, $5, $ff

	db $0 ; signs

	db $8 ; people
	db SPRITE_BLACKBELT, $a + 4, $4 + 4, $ff, $d0, $41, KOGA + $C8, $1 ; trainer
	db SPRITE_ROCKER, $d + 4, $8 + 4, $ff, $d0, $42, JUGGLER + $C8, $7 ; trainer
	db SPRITE_ROCKER, $8 + 4, $7 + 4, $ff, $d3, $43, JUGGLER + $C8, $3 ; trainer
	db SPRITE_ROCKER, $c + 4, $1 + 4, $ff, $d0, $44, JUGGLER + $C8, $8 ; trainer
	db SPRITE_ROCKER, $5 + 4, $3 + 4, $ff, $d1, $45, TAMER + $C8, $1 ; trainer
	db SPRITE_ROCKER, $2 + 4, $8 + 4, $ff, $d0, $46, TAMER + $C8, $2 ; trainer
	db SPRITE_ROCKER, $7 + 4, $2 + 4, $ff, $d2, $47, JUGGLER + $C8, $4 ; trainer
	db SPRITE_GYM_HELPER, $f + 4, $7 + 4, $ff, $d0, $8 ; person

	; warp-to
	EVENT_DISP FUCHSIA_GYM_WIDTH, $11, $4
	EVENT_DISP FUCHSIA_GYM_WIDTH, $11, $5
