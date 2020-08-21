CeladonMart1F_Object:
	db $f ; border block

	def_warps
	warp  2,  7, 0, LAST_MAP
	warp  3,  7, 0, LAST_MAP
	warp 16,  7, 1, LAST_MAP
	warp 17,  7, 1, LAST_MAP
	warp 12,  1, 0, CELADON_MART_2F
	warp  1,  1, 0, CELADON_MART_ELEVATOR

	def_signs
	sign 11,  4, 2 ; CeladonMart1Text2
	sign 14,  1, 3 ; CeladonMart1Text3

	def_objects
	object SPRITE_LINK_RECEPTIONIST, 8, 3, STAY, DOWN, 1 ; person

	def_warps_to CELADON_MART_1F
