	object_const_def
	const_export VERMILIONPIDGEYHOUSE_YOUNGSTER
	const_export VERMILIONPIDGEYHOUSE_PIDGEY
	const_export VERMILIONPIDGEYHOUSE_LETTER

VermilionPidgeyHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 5
	warp_event  3,  7, LAST_MAP, 5

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_YOUNGSTER, STAY, LEFT, TEXT_VERMILIONPIDGEYHOUSE_YOUNGSTER
	object_event  3,  5, SPRITE_BIRD, WALK, LEFT_RIGHT, TEXT_VERMILIONPIDGEYHOUSE_PIDGEY
	object_event  4,  3, SPRITE_PAPER, STAY, NONE, TEXT_VERMILIONPIDGEYHOUSE_LETTER

	def_warps_to VERMILION_PIDGEY_HOUSE
