SafariZoneNorth_Object:
	db $0 ; border block

	def_warps
	warp  2, 35, 0, SAFARI_ZONE_WEST
	warp  3, 35, 1, SAFARI_ZONE_WEST
	warp  8, 35, 2, SAFARI_ZONE_WEST
	warp  9, 35, 3, SAFARI_ZONE_WEST
	warp 20, 35, 4, SAFARI_ZONE_CENTER
	warp 21, 35, 5, SAFARI_ZONE_CENTER
	warp 39, 30, 0, SAFARI_ZONE_EAST
	warp 39, 31, 1, SAFARI_ZONE_EAST
	warp 35,  3, 0, SAFARI_ZONE_NORTH_REST_HOUSE

	def_signs
	sign 36,  4, 3 ; SafariZoneNorthText3
	sign  4, 25, 4 ; SafariZoneNorthText4
	sign 13, 31, 5 ; SafariZoneNorthText5
	sign 19, 33, 6 ; SafariZoneNorthText6
	sign 26, 28, 7 ; SafariZoneNorthText7

	def_objects
	object SPRITE_POKE_BALL, 25, 1, STAY, NONE, 1, PROTEIN
	object SPRITE_POKE_BALL, 19, 7, STAY, NONE, 2, TM_SKULL_BASH

	def_warps_to SAFARI_ZONE_NORTH
