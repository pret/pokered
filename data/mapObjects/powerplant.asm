PowerPlantObject: ; 0x1e3bf (size=135)
	db $2e ; border block

	db $3 ; warps
	db $23, $4, $3, $ff
	db $23, $5, $3, $ff
	db $b, $0, $3, $ff

	db $0 ; signs

	db $e ; people
	db SPRITE_BALL, $14 + 4, $9 + 4, $ff, $ff, $41, VOLTORB, 40 ; trainer
	db SPRITE_BALL, $12 + 4, $20 + 4, $ff, $ff, $42, VOLTORB, 40 ; trainer
	db SPRITE_BALL, $19 + 4, $15 + 4, $ff, $ff, $43, VOLTORB, 40 ; trainer
	db SPRITE_BALL, $12 + 4, $19 + 4, $ff, $ff, $44, ELECTRODE, 43 ; trainer
	db SPRITE_BALL, $22 + 4, $17 + 4, $ff, $ff, $45, VOLTORB, 40 ; trainer
	db SPRITE_BALL, $1c + 4, $1a + 4, $ff, $ff, $46, VOLTORB, 40 ; trainer
	db SPRITE_BALL, $e + 4, $15 + 4, $ff, $ff, $47, ELECTRODE, 43 ; trainer
	db SPRITE_BALL, $20 + 4, $25 + 4, $ff, $ff, $48, VOLTORB, 40 ; trainer
	db SPRITE_BIRD, $9 + 4, $4 + 4, $ff, $d1, $49, ZAPDOS, 50 ; trainer
	db SPRITE_BALL, $19 + 4, $7 + 4, $ff, $ff, $8a, CARBOS ; item
	db SPRITE_BALL, $3 + 4, $1c + 4, $ff, $ff, $8b, HP_UP ; item
	db SPRITE_BALL, $3 + 4, $22 + 4, $ff, $ff, $8c, RARE_CANDY ; item
	db SPRITE_BALL, $20 + 4, $1a + 4, $ff, $ff, $8d, TM_25 ; item
	db SPRITE_BALL, $20 + 4, $14 + 4, $ff, $ff, $8e, TM_33 ; item

	; warp-to
	EVENT_DISP POWER_PLANT_WIDTH, $23, $4
	EVENT_DISP POWER_PLANT_WIDTH, $23, $5
	EVENT_DISP POWER_PLANT_WIDTH, $b, $0
