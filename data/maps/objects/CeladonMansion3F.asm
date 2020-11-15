CeladonMansion3F_Object:
	db $f ; border block

	def_warps
	warp  6,  1, 0, CELADON_MANSION_2F
	warp  7,  1, 0, CELADON_MANSION_ROOF
	warp  2,  1, 1, CELADON_MANSION_ROOF
	warp  4,  1, 3, CELADON_MANSION_2F

	def_signs
	sign  1,  3, 5 ; CeladonMansion3Text5
	sign  4,  3, 6 ; CeladonMansion3Text6
	sign  1,  6, 7 ; CeladonMansion3Text7
	sign  4,  9, 8 ; CeladonMansion3Text8

	def_objects
	object SPRITE_BIKE_SHOP_CLERK, 0, 4, STAY, UP, 1 ; person
	object SPRITE_CLERK, 3, 4, STAY, UP, 2 ; person
	object SPRITE_SUPER_NERD, 0, 7, STAY, UP, 3 ; person
	object SPRITE_SILPH_WORKER, 2, 3, STAY, NONE, 4 ; person

	def_warps_to CELADON_MANSION_3F
