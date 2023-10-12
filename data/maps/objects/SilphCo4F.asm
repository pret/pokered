	object_const_def
	const_export SILPHCO4F_SILPH_WORKER_M
	const_export SILPHCO4F_ROCKET1
	const_export SILPHCO4F_SCIENTIST
	const_export SILPHCO4F_ROCKET2
	const_export SILPHCO4F_FULL_HEAL
	const_export SILPHCO4F_MAX_REVIVE
	const_export SILPHCO4F_ESCAPE_ROPE

SilphCo4F_Object:
	db $2e ; border block

	def_warp_events
	warp_event 24,  0, SILPH_CO_3F, 2
	warp_event 26,  0, SILPH_CO_5F, 2
	warp_event 20,  0, SILPH_CO_ELEVATOR, 1
	warp_event 11,  7, SILPH_CO_10F, 4
	warp_event 17,  3, SILPH_CO_6F, 4
	warp_event  3, 15, SILPH_CO_10F, 5
	warp_event 17, 11, SILPH_CO_10F, 6

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_SILPH_WORKER_M, STAY, NONE, TEXT_SILPHCO4F_SILPH_WORKER_M
	object_event  9, 14, SPRITE_ROCKET, STAY, RIGHT, TEXT_SILPHCO4F_ROCKET1, OPP_ROCKET, 26
	object_event 14,  6, SPRITE_SCIENTIST, STAY, LEFT, TEXT_SILPHCO4F_SCIENTIST, OPP_SCIENTIST, 5
	object_event 26, 10, SPRITE_ROCKET, STAY, UP, TEXT_SILPHCO4F_ROCKET2, OPP_ROCKET, 27
	object_event  3,  9, SPRITE_POKE_BALL, STAY, NONE, TEXT_SILPHCO4F_FULL_HEAL, FULL_HEAL
	object_event  4,  7, SPRITE_POKE_BALL, STAY, NONE, TEXT_SILPHCO4F_MAX_REVIVE, MAX_REVIVE
	object_event  5,  8, SPRITE_POKE_BALL, STAY, NONE, TEXT_SILPHCO4F_ESCAPE_ROPE, ESCAPE_ROPE

	def_warps_to SILPH_CO_4F
