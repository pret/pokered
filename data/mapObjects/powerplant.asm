PowerPlantObject:
	db $2e ; border block

	db $3 ; warps
	db $23, $4, $3, $ff
	db $23, $5, $3, $ff
	db $b, $0, $3, $ff

	db $0 ; signs

	db $e ; objects
	object SPRITE_BALL, $9, $14, STAY, NONE, $1, VOLTORB, 40
	object SPRITE_BALL, $20, $12, STAY, NONE, $2, VOLTORB, 40
	object SPRITE_BALL, $15, $19, STAY, NONE, $3, VOLTORB, 40
	object SPRITE_BALL, $19, $12, STAY, NONE, $4, ELECTRODE, 43
	object SPRITE_BALL, $17, $22, STAY, NONE, $5, VOLTORB, 40
	object SPRITE_BALL, $1a, $1c, STAY, NONE, $6, VOLTORB, 40
	object SPRITE_BALL, $15, $e, STAY, NONE, $7, ELECTRODE, 43
	object SPRITE_BALL, $25, $20, STAY, NONE, $8, VOLTORB, 40
	object SPRITE_BIRD, $4, $9, STAY, UP, $9, ZAPDOS, 50
	object SPRITE_BALL, $7, $19, STAY, NONE, $a, CARBOS
	object SPRITE_BALL, $1c, $3, STAY, NONE, $b, HP_UP
	object SPRITE_BALL, $22, $3, STAY, NONE, $c, RARE_CANDY
	object SPRITE_BALL, $1a, $20, STAY, NONE, $d, TM_25
	object SPRITE_BALL, $14, $20, STAY, NONE, $e, TM_33

	; warp-to
	EVENT_DISP POWER_PLANT_WIDTH, $23, $4
	EVENT_DISP POWER_PLANT_WIDTH, $23, $5
	EVENT_DISP POWER_PLANT_WIDTH, $b, $0
