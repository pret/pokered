MrFujisHouse_Object:
	db $a ; border block

	def_warps
	warp  2,  7, 2, LAST_MAP
	warp  3,  7, 2, LAST_MAP

	def_signs

	def_objects
	object SPRITE_SUPER_NERD, 3, 5, STAY, NONE, 1 ; person
	object SPRITE_LITTLE_GIRL, 6, 3, STAY, DOWN, 2 ; person
	object SPRITE_MONSTER, 6, 4, STAY, UP, 3 ; person
	object SPRITE_MONSTER, 1, 3, STAY, NONE, 4 ; person
	object SPRITE_MR_FUJI, 3, 1, STAY, NONE, 5 ; person
	object SPRITE_POKEDEX, 3, 3, STAY, NONE, 6 ; person

	def_warps_to MR_FUJIS_HOUSE
