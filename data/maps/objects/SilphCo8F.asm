	object_const_def
	const_export SILPHCO8F_SILPH_WORKER_M
	const_export SILPHCO8F_ROCKET1
	const_export SILPHCO8F_SCIENTIST
	const_export SILPHCO8F_ROCKET2

SilphCo8F_Object:
	db $2e ; border block

	def_warp_events
	warp_event 16,  0, SILPH_CO_9F, 2
	warp_event 14,  0, SILPH_CO_7F, 1
	warp_event 18,  0, SILPH_CO_ELEVATOR, 1
	warp_event  3, 11, SILPH_CO_8F, 7
	warp_event  3, 15, SILPH_CO_2F, 5
	warp_event 11,  5, SILPH_CO_2F, 6
	warp_event 11,  9, SILPH_CO_8F, 4

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_SILPH_WORKER_M, STAY, NONE, TEXT_SILPHCO8F_SILPH_WORKER_M
	object_event 19,  2, SPRITE_ROCKET, STAY, LEFT, TEXT_SILPHCO8F_ROCKET1, OPP_ROCKET, 35
	object_event 10,  2, SPRITE_SCIENTIST, STAY, DOWN, TEXT_SILPHCO8F_SCIENTIST, OPP_SCIENTIST, 9
	object_event 12, 15, SPRITE_ROCKET, STAY, RIGHT, TEXT_SILPHCO8F_ROCKET2, OPP_ROCKET, 36

	def_warps_to SILPH_CO_8F
