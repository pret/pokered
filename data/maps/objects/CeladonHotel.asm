	object_const_def
	const_export CELADONHOTEL_GRANNY
	const_export CELADONHOTEL_BEAUTY
	const_export CELADONHOTEL_SUPER_NERD

CeladonHotel_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 13
	warp_event  4,  7, LAST_MAP, 13

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_GRANNY, STAY, DOWN, TEXT_CELADONHOTEL_GRANNY
	object_event  2,  4, SPRITE_BEAUTY, STAY, NONE, TEXT_CELADONHOTEL_BEAUTY
	object_event  8,  4, SPRITE_SUPER_NERD, WALK, LEFT_RIGHT, TEXT_CELADONHOTEL_SUPER_NERD

	def_warps_to CELADON_HOTEL
