	object_const_def
	const_export VERMILIONOLDRODHOUSE_FISHING_GURU

VermilionOldRodHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 9
	warp_event  3,  7, LAST_MAP, 9

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_FISHING_GURU, STAY, RIGHT, TEXT_VERMILIONOLDRODHOUSE_FISHING_GURU

	def_warps_to VERMILION_OLD_ROD_HOUSE
