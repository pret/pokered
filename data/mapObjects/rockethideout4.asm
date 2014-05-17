RocketHideout4Object: ; 0x455f1 (size=95)
	db $2e ; border block

	db $3 ; warps
	db $a, $13, $1, ROCKET_HIDEOUT_3
	db $f, $18, $0, ROCKET_HIDEOUT_ELEVATOR
	db $f, $19, $1, ROCKET_HIDEOUT_ELEVATOR

	db $0 ; signs

	db $9 ; people
	db SPRITE_GIOVANNI, $3 + 4, $19 + 4, $ff, $d0, $41, GIOVANNI + $C8, $1 ; trainer
	db SPRITE_ROCKET, $c + 4, $17 + 4, $ff, $d0, $42, ROCKET + $C8, $10 ; trainer
	db SPRITE_ROCKET, $c + 4, $1a + 4, $ff, $d0, $43, ROCKET + $C8, $11 ; trainer
	db SPRITE_ROCKET, $2 + 4, $b + 4, $ff, $d0, $44, ROCKET + $C8, $12 ; trainer
	db SPRITE_BALL, $c + 4, $a + 4, $ff, $ff, $85, HP_UP ; item
	db SPRITE_BALL, $4 + 4, $9 + 4, $ff, $ff, $86, TM_02 ; item
	db SPRITE_BALL, $14 + 4, $c + 4, $ff, $ff, $87, IRON ; item
	db SPRITE_BALL, $2 + 4, $19 + 4, $ff, $ff, $88, SILPH_SCOPE ; item
	db SPRITE_BALL, $2 + 4, $a + 4, $ff, $ff, $89, LIFT_KEY ; item

	; warp-to
	EVENT_DISP ROCKET_HIDEOUT_4_WIDTH, $a, $13 ; ROCKET_HIDEOUT_3
	EVENT_DISP ROCKET_HIDEOUT_4_WIDTH, $f, $18 ; ROCKET_HIDEOUT_ELEVATOR
	EVENT_DISP ROCKET_HIDEOUT_4_WIDTH, $f, $19 ; ROCKET_HIDEOUT_ELEVATOR
