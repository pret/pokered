Route22_Object:
	db $2c ; border block

	def_warps
	warp  8,  5, 0, ROUTE_22_GATE

	def_signs
	sign  7, 11, 3 ; Route22FrontGateText

	def_objects
	object SPRITE_BLUE, 25, 5, STAY, NONE, 1 ; person
	object SPRITE_BLUE, 25, 5, STAY, NONE, 2 ; person

	def_warps_to ROUTE_22
