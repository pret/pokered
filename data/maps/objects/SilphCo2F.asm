	object_const_def
	const_export SILPHCO2F_SILPH_WORKER_F
	const_export SILPHCO2F_SCIENTIST1
	const_export SILPHCO2F_SCIENTIST2
	const_export SILPHCO2F_ROCKET1
	const_export SILPHCO2F_ROCKET2

SilphCo2F_Object:
	db $2e ; border block

	def_warp_events
	warp_event 24,  0, SILPH_CO_1F, 3
	warp_event 26,  0, SILPH_CO_3F, 1
	warp_event 20,  0, SILPH_CO_ELEVATOR, 1
	warp_event  3,  3, SILPH_CO_3F, 7
	warp_event 13,  3, SILPH_CO_8F, 5
	warp_event 27, 15, SILPH_CO_8F, 6
	warp_event  9, 15, SILPH_CO_6F, 5

	def_bg_events

	def_object_events
	object_event 10,  1, SPRITE_SILPH_WORKER_F, STAY, UP, TEXT_SILPHCO2F_SILPH_WORKER_F
	object_event  5, 12, SPRITE_SCIENTIST, STAY, DOWN, TEXT_SILPHCO2F_SCIENTIST1, OPP_SCIENTIST, 2
	object_event 24, 13, SPRITE_SCIENTIST, STAY, LEFT, TEXT_SILPHCO2F_SCIENTIST2, OPP_SCIENTIST, 3
	object_event 16, 11, SPRITE_ROCKET, STAY, UP, TEXT_SILPHCO2F_ROCKET1, OPP_ROCKET, 23
	object_event 24,  7, SPRITE_ROCKET, STAY, UP, TEXT_SILPHCO2F_ROCKET2, OPP_ROCKET, 24

	def_warps_to SILPH_CO_2F
