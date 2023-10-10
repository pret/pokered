	object_const_def
	const_export SILPHCO11F_SILPH_PRESIDENT
	const_export SILPHCO11F_BEAUTY
	const_export SILPHCO11F_GIOVANNI
	const_export SILPHCO11F_ROCKET1
	const_export SILPHCO11F_ROCKET2

SilphCo11F_Object:
	db $d ; border block

	def_warp_events
	warp_event  9,  0, SILPH_CO_10F, 2
	warp_event 13,  0, SILPH_CO_ELEVATOR, 1
	warp_event  5,  5, LAST_MAP, 10
	warp_event  3,  2, SILPH_CO_7F, 4

	def_bg_events

	def_object_events
	object_event  7,  5, SPRITE_SILPH_PRESIDENT, STAY, DOWN, TEXT_SILPHCO11F_SILPH_PRESIDENT
	object_event 10,  5, SPRITE_BEAUTY, STAY, DOWN, TEXT_SILPHCO11F_BEAUTY
	object_event  6,  9, SPRITE_GIOVANNI, STAY, DOWN, TEXT_SILPHCO11F_GIOVANNI, OPP_GIOVANNI, 2
	object_event  3, 16, SPRITE_ROCKET, STAY, UP, TEXT_SILPHCO11F_ROCKET1, OPP_ROCKET, 41
	object_event 15,  9, SPRITE_ROCKET, STAY, UP, TEXT_SILPHCO11F_ROCKET2, OPP_ROCKET, 40

	def_warps_to SILPH_CO_11F
