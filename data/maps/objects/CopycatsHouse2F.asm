CopycatsHouse2F_Object:
	db $a ; border block

	def_warps
	warp  7,  1, 2, COPYCATS_HOUSE_1F

	def_signs
	sign  3,  5, 6 ; CopycatsHouse2FText6
	sign  0,  1, 7 ; CopycatsHouse2FText7

	def_objects
	object SPRITE_BRUNETTE_GIRL, 4, 3, WALK, ANY_DIR, 1 ; person
	object SPRITE_BIRD, 4, 6, WALK, LEFT_RIGHT, 2 ; person
	object SPRITE_MONSTER, 5, 1, STAY, DOWN, 3 ; person
	object SPRITE_BIRD, 2, 0, STAY, DOWN, 4 ; person
	object SPRITE_FAIRY, 1, 6, STAY, RIGHT, 5 ; person

	def_warps_to COPYCATS_HOUSE_2F
