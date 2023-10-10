	object_const_def
	const_export SAFFRONPIDGEYHOUSE_BRUNETTE_GIRL
	const_export SAFFRONPIDGEYHOUSE_PIDGEY
	const_export SAFFRONPIDGEYHOUSE_YOUNGSTER
	const_export SAFFRONPIDGEYHOUSE_PAPER

SaffronPidgeyHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 4
	warp_event  3,  7, LAST_MAP, 4

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_BRUNETTE_GIRL, STAY, RIGHT, TEXT_SAFFRONPIDGEYHOUSE_BRUNETTE_GIRL
	object_event  0,  4, SPRITE_BIRD, WALK, UP_DOWN, TEXT_SAFFRONPIDGEYHOUSE_PIDGEY
	object_event  4,  1, SPRITE_YOUNGSTER, STAY, DOWN, TEXT_SAFFRONPIDGEYHOUSE_YOUNGSTER
	object_event  3,  3, SPRITE_PAPER, STAY, NONE, TEXT_SAFFRONPIDGEYHOUSE_PAPER

	def_warps_to SAFFRON_PIDGEY_HOUSE
