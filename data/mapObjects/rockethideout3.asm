RocketHideout3Object: ; 0x4534d (size=50)
	db $2e ; border block

	db $2 ; warps
	db $6, $19, $1, ROCKET_HIDEOUT_2
	db $12, $13, $0, ROCKET_HIDEOUT_4

	db $0 ; signs

	db $4 ; people
	db SPRITE_ROCKET, $16 + 4, $a + 4, $ff, $d3, $41, ROCKET + $C8, $e ; trainer
	db SPRITE_ROCKET, $c + 4, $1a + 4, $ff, $d1, $42, ROCKET + $C8, $f ; trainer
	db SPRITE_BALL, $11 + 4, $1a + 4, $ff, $ff, $83, TM_10 ; item
	db SPRITE_BALL, $e + 4, $14 + 4, $ff, $ff, $84, RARE_CANDY ; item

	; warp-to
	EVENT_DISP ROCKET_HIDEOUT_3_WIDTH, $6, $19 ; ROCKET_HIDEOUT_2
	EVENT_DISP ROCKET_HIDEOUT_3_WIDTH, $12, $13 ; ROCKET_HIDEOUT_4
