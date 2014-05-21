RocketHideout3Object: ; 0x4534d (size=50)
	db $2e ; border block

	db $2 ; warps
	db $6, $19, $1, ROCKET_HIDEOUT_2
	db $12, $13, $0, ROCKET_HIDEOUT_4

	db $0 ; signs

	db $4 ; people
	db SPRITE_ROCKET, $16 + 4, $a + 4, $ff, $d3, TRAINER | $1, ROCKET + $C8, $e
	db SPRITE_ROCKET, $c + 4, $1a + 4, $ff, $d1, TRAINER | $2, ROCKET + $C8, $f
	db SPRITE_BALL, $11 + 4, $1a + 4, $ff, $ff, ITEM | $3, TM_10
	db SPRITE_BALL, $e + 4, $14 + 4, $ff, $ff, ITEM | $4, RARE_CANDY

	; warp-to
	EVENT_DISP ROCKET_HIDEOUT_3_WIDTH, $6, $19 ; ROCKET_HIDEOUT_2
	EVENT_DISP ROCKET_HIDEOUT_3_WIDTH, $12, $13 ; ROCKET_HIDEOUT_4
