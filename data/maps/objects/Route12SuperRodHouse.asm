	object_const_def
	const_export ROUTE12SUPERRODHOUSE_FISHING_GURU

Route12SuperRodHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 4
	warp_event  3,  7, LAST_MAP, 4

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_FISHING_GURU, STAY, RIGHT, TEXT_ROUTE12SUPERRODHOUSE_FISHING_GURU

	def_warps_to ROUTE_12_SUPER_ROD_HOUSE
