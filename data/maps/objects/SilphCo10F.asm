	object_const_def
	const_export SILPHCO10F_ROCKET
	const_export SILPHCO10F_SCIENTIST
	const_export SILPHCO10F_SILPH_WORKER_F
	const_export SILPHCO10F_TM_EARTHQUAKE
	const_export SILPHCO10F_RARE_CANDY
	const_export SILPHCO10F_CARBOS

SilphCo10F_Object:
	db $2e ; border block

	def_warp_events
	warp_event  8,  0, SILPH_CO_9F, 1
	warp_event 10,  0, SILPH_CO_11F, 1
	warp_event 12,  0, SILPH_CO_ELEVATOR, 1
	warp_event  9, 11, SILPH_CO_4F, 4
	warp_event 13, 15, SILPH_CO_4F, 6
	warp_event 13,  7, SILPH_CO_4F, 7

	def_bg_events

	def_object_events
	object_event  1,  9, SPRITE_ROCKET, STAY, RIGHT, TEXT_SILPHCO10F_ROCKET, OPP_ROCKET, 39
	object_event 10,  2, SPRITE_SCIENTIST, STAY, LEFT, TEXT_SILPHCO10F_SCIENTIST, OPP_SCIENTIST, 11
	object_event  9, 15, SPRITE_SILPH_WORKER_F, WALK, ANY_DIR, TEXT_SILPHCO10F_SILPH_WORKER_F
	object_event  2, 12, SPRITE_POKE_BALL, STAY, NONE, TEXT_SILPHCO10F_TM_EARTHQUAKE, TM_EARTHQUAKE
	object_event  4, 14, SPRITE_POKE_BALL, STAY, NONE, TEXT_SILPHCO10F_RARE_CANDY, RARE_CANDY
	object_event  5, 11, SPRITE_POKE_BALL, STAY, NONE, TEXT_SILPHCO10F_CARBOS, CARBOS

	def_warps_to SILPH_CO_10F
