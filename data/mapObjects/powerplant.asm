PowerPlantObject: ; 0x1e3bf (size=135)
	db $2e ; border block

	db $3 ; warps
	db $23, $4, $3, $ff
	db $23, $5, $3, $ff
	db $b, $0, $3, $ff

	db $0 ; signs

	db $e ; people
	db SPRITE_BALL, $14 + 4, $9 + 4, $ff, $ff, TRAINER | $1, VOLTORB, 40
	db SPRITE_BALL, $12 + 4, $20 + 4, $ff, $ff, TRAINER | $2, VOLTORB, 40
	db SPRITE_BALL, $19 + 4, $15 + 4, $ff, $ff, TRAINER | $3, VOLTORB, 40
	db SPRITE_BALL, $12 + 4, $19 + 4, $ff, $ff, TRAINER | $4, ELECTRODE, 43
	db SPRITE_BALL, $22 + 4, $17 + 4, $ff, $ff, TRAINER | $5, VOLTORB, 40
	db SPRITE_BALL, $1c + 4, $1a + 4, $ff, $ff, TRAINER | $6, VOLTORB, 40
	db SPRITE_BALL, $e + 4, $15 + 4, $ff, $ff, TRAINER | $7, ELECTRODE, 43
	db SPRITE_BALL, $20 + 4, $25 + 4, $ff, $ff, TRAINER | $8, VOLTORB, 40
	db SPRITE_BIRD, $9 + 4, $4 + 4, $ff, $d1, TRAINER | $9, ZAPDOS, 50
	db SPRITE_BALL, $19 + 4, $7 + 4, $ff, $ff, ITEM | $a, CARBOS
	db SPRITE_BALL, $3 + 4, $1c + 4, $ff, $ff, ITEM | $b, HP_UP
	db SPRITE_BALL, $3 + 4, $22 + 4, $ff, $ff, ITEM | $c, RARE_CANDY
	db SPRITE_BALL, $20 + 4, $1a + 4, $ff, $ff, ITEM | $d, TM_25
	db SPRITE_BALL, $20 + 4, $14 + 4, $ff, $ff, ITEM | $e, TM_33

	; warp-to
	EVENT_DISP POWER_PLANT_WIDTH, $23, $4
	EVENT_DISP POWER_PLANT_WIDTH, $23, $5
	EVENT_DISP POWER_PLANT_WIDTH, $b, $0
