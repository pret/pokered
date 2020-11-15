Route1_Object:
	db $b ; border block

	def_warps

	def_signs
	sign  9, 27, 3 ; Route1Text3

	def_objects
	object SPRITE_YOUNGSTER, 5, 24, WALK, UP_DOWN, 1 ; person
	object SPRITE_YOUNGSTER, 15, 13, WALK, LEFT_RIGHT, 2 ; person

	def_warps_to ROUTE_1

	; unused
	warp_to 2, 7, 4
