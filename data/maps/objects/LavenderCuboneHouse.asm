	object_const_def
	const_export LAVENDERCUBONEHOUSE_CUBONE
	const_export LAVENDERCUBONEHOUSE_BRUNETTE_GIRL

LavenderCuboneHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 5
	warp_event  3,  7, LAST_MAP, 5

	def_bg_events

	def_object_events
	object_event  3,  5, SPRITE_MONSTER, STAY, UP, TEXT_LAVENDERCUBONEHOUSE_CUBONE
	object_event  2,  4, SPRITE_BRUNETTE_GIRL, STAY, RIGHT, TEXT_LAVENDERCUBONEHOUSE_BRUNETTE_GIRL

	def_warps_to LAVENDER_CUBONE_HOUSE
