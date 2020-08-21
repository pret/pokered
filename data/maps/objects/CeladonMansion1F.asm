CeladonMansion1F_Object:
	db $f ; border block

	def_warps
	warp  4, 11, 2, LAST_MAP
	warp  5, 11, 2, LAST_MAP
	warp  4,  0, 4, LAST_MAP
	warp  7,  1, 1, CELADON_MANSION_2F
	warp  2,  1, 2, CELADON_MANSION_2F

	def_signs
	sign  4,  9, 5 ; CeladonMansion1Text5

	def_objects
	object SPRITE_MONSTER, 0, 5, STAY, RIGHT, 1 ; person
	object SPRITE_GRANNY, 1, 5, STAY, DOWN, 2 ; person
	object SPRITE_FAIRY, 1, 8, WALK, LEFT_RIGHT, 3 ; person
	object SPRITE_MONSTER, 4, 4, WALK, UP_DOWN, 4 ; person

	def_warps_to CELADON_MANSION_1F
