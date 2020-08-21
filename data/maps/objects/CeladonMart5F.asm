CeladonMart5F_Object:
	db $f ; border block

	def_warps
	warp 12,  1, 0, CELADON_MART_ROOF
	warp 16,  1, 1, CELADON_MART_4F
	warp  1,  1, 0, CELADON_MART_ELEVATOR

	def_signs
	sign 14,  1, 5 ; CeladonMart5Text5

	def_objects
	object SPRITE_GENTLEMAN, 14, 5, WALK, UP_DOWN, 1 ; person
	object SPRITE_SAILOR, 2, 6, STAY, NONE, 2 ; person
	object SPRITE_CLERK, 5, 3, STAY, DOWN, 3 ; person
	object SPRITE_CLERK, 6, 3, STAY, DOWN, 4 ; person

	def_warps_to CELADON_MART_5F
