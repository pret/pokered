CeladonMartRoof_Object:
	db $42 ; border block

	def_warps
	warp 15,  2, 0, CELADON_MART_5F

	def_signs
	sign 10,  1, 3 ; CeladonMartRoofText3
	sign 11,  1, 4 ; CeladonMartRoofText4
	sign 12,  2, 5 ; CeladonMartRoofText5
	sign 13,  2, 6 ; CeladonMartRoofText6

	def_objects
	object SPRITE_SUPER_NERD, 10, 4, STAY, LEFT, 1 ; person
	object SPRITE_LITTLE_GIRL, 5, 5, WALK, ANY_DIR, 2 ; person

	def_warps_to CELADON_MART_ROOF
