	object_const_def
	const_export CERULEANCAVEB1F_MEWTWO
	const_export CERULEANCAVEB1F_ULTRA_BALL
	const_export CERULEANCAVEB1F_MAX_REVIVE

CeruleanCaveB1F_Object:
	db $7d ; border block

	def_warp_events
	warp_event  3,  6, CERULEAN_CAVE_1F, 9

	def_bg_events

	def_object_events
	object_event 27, 13, SPRITE_MONSTER, STAY, DOWN, TEXT_CERULEANCAVEB1F_MEWTWO, MEWTWO, 70
	object_event 16,  9, SPRITE_POKE_BALL, STAY, NONE, TEXT_CERULEANCAVEB1F_ULTRA_BALL, ULTRA_BALL
	object_event 18,  1, SPRITE_POKE_BALL, STAY, NONE, TEXT_CERULEANCAVEB1F_MAX_REVIVE, MAX_REVIVE

	def_warps_to CERULEAN_CAVE_B1F
