PowerPlant_Object:
	db $2e ; border block

	db 3 ; warps
	warp 4, 35, 3, -1
	warp 5, 35, 3, -1
	warp 0, 11, 3, -1

	db 0 ; signs

	db 14 ; objects
	object SPRITE_BALL, 9, 20, STAY, NONE, 1, VOLTORB, 40
	object SPRITE_BALL, 32, 18, STAY, NONE, 2, VOLTORB, 40
	object SPRITE_BALL, 21, 25, STAY, NONE, 3, VOLTORB, 40
	object SPRITE_BALL, 25, 18, STAY, NONE, 4, ELECTRODE, 43
	object SPRITE_BALL, 23, 34, STAY, NONE, 5, VOLTORB, 40
	object SPRITE_BALL, 26, 28, STAY, NONE, 6, VOLTORB, 40
	object SPRITE_BALL, 21, 14, STAY, NONE, 7, ELECTRODE, 43
	object SPRITE_BALL, 37, 32, STAY, NONE, 8, VOLTORB, 40
	object SPRITE_BIRD, 4, 9, STAY, UP, 9, ZAPDOS, 50
	object SPRITE_BALL, 7, 25, STAY, NONE, 10, CARBOS
	object SPRITE_BALL, 28, 3, STAY, NONE, 11, HP_UP
	object SPRITE_BALL, 34, 3, STAY, NONE, 12, RARE_CANDY
	object SPRITE_BALL, 26, 32, STAY, NONE, 13, TM_25
	object SPRITE_BALL, 20, 32, STAY, NONE, 14, TM_33

	; warp-to
	warp_to 4, 35, POWER_PLANT_WIDTH
	warp_to 5, 35, POWER_PLANT_WIDTH
	warp_to 0, 11, POWER_PLANT_WIDTH
