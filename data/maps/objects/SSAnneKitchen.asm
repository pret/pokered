SSAnneKitchen_Object:
	db $c ; border block

	def_warps
	warp  6,  0, 10, SS_ANNE_1F

	def_signs

	def_objects
	object SPRITE_COOK, 1, 8, WALK, UP_DOWN, 1 ; person
	object SPRITE_COOK, 5, 8, WALK, UP_DOWN, 2 ; person
	object SPRITE_COOK, 9, 7, WALK, UP_DOWN, 3 ; person
	object SPRITE_COOK, 13, 6, STAY, NONE, 4 ; person
	object SPRITE_COOK, 13, 8, STAY, NONE, 5 ; person
	object SPRITE_COOK, 13, 10, STAY, NONE, 6 ; person
	object SPRITE_COOK, 11, 13, STAY, UP, 7 ; person

	def_warps_to SS_ANNE_KITCHEN
