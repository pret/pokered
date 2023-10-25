	object_const_def
	const_export CELADONHOTEL_CHANNELER
	const_export CELADONHOTEL_GRANNY
	const_export CELADONHOTEL_BEAUTY
	const_export CELADONHOTEL_SUPER_NERD
	const_export CELADONHOTEL_LAPRAS_GUY

CeladonHotel_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 13
	warp_event  4,  7, LAST_MAP, 13

	def_bg_events

	def_object_events
	object_event 11,  7, SPRITE_CHANNELER, WALK, UP_DOWN, TEXT_CELADONHOTEL_CHANNELER, OPP_CHANNELER, 1 
	object_event  3,  1, SPRITE_GRANNY, STAY, DOWN, TEXT_CELADONHOTEL_GRANNY
	object_event  2,  4, SPRITE_BEAUTY, STAY, NONE, TEXT_CELADONHOTEL_BEAUTY
	object_event  8,  4, SPRITE_SUPER_NERD, WALK, LEFT_RIGHT, TEXT_CELADONHOTEL_SUPER_NERD
	object_event  5,  3, SPRITE_SILPH_WORKER_M, STAY, NONE, TEXT_CELADONHOTEL_LAPRAS_GUY

	def_warps_to CELADON_HOTEL
