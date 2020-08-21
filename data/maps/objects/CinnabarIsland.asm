CinnabarIsland_Object:
	db $43 ; border block

	def_warps
	warp  6,  3, 1, POKEMON_MANSION_1F
	warp 18,  3, 0, CINNABAR_GYM
	warp  6,  9, 0, CINNABAR_LAB
	warp 11, 11, 0, CINNABAR_POKECENTER
	warp 15, 11, 0, CINNABAR_MART

	def_signs
	sign  9,  5, 3 ; CinnabarIslandText3
	sign 16, 11, 4 ; MartSignText
	sign 12, 11, 5 ; PokeCenterSignText
	sign  9, 11, 6 ; CinnabarIslandText6
	sign 13,  3, 7 ; CinnabarIslandText7

	def_objects
	object SPRITE_GIRL, 12, 5, WALK, LEFT_RIGHT, 1 ; person
	object SPRITE_GAMBLER, 14, 6, STAY, NONE, 2 ; person

	def_warps_to CINNABAR_ISLAND
