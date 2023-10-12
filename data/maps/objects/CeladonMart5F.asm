	object_const_def
	const_export CELADONMART5F_GENTLEMAN
	const_export CELADONMART5F_SAILOR
	const_export CELADONMART5F_CLERK1
	const_export CELADONMART5F_CLERK2

CeladonMart5F_Object:
	db $f ; border block

	def_warp_events
	warp_event 12,  1, CELADON_MART_ROOF, 1
	warp_event 16,  1, CELADON_MART_4F, 2
	warp_event  1,  1, CELADON_MART_ELEVATOR, 1

	def_bg_events
	bg_event 14,  1, TEXT_CELADONMART5F_CURRENT_FLOOR_SIGN

	def_object_events
	object_event 14,  5, SPRITE_GENTLEMAN, WALK, UP_DOWN, TEXT_CELADONMART5F_GENTLEMAN
	object_event  2,  6, SPRITE_SAILOR, STAY, NONE, TEXT_CELADONMART5F_SAILOR
	object_event  5,  3, SPRITE_CLERK, STAY, DOWN, TEXT_CELADONMART5F_CLERK1
	object_event  6,  3, SPRITE_CLERK, STAY, DOWN, TEXT_CELADONMART5F_CLERK2

	def_warps_to CELADON_MART_5F
