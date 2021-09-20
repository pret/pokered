CeladonMart1F_Object:
	db $f ; border block

	def_warp_events
	warp_event  2,  7, 0, LAST_MAP
	warp_event  3,  7, 0, LAST_MAP
	warp_event 16,  7, 1, LAST_MAP
	warp_event 17,  7, 1, LAST_MAP
	warp_event 12,  1, 0, CELADON_MART_2F
	warp_event  1,  1, 0, CELADON_MART_ELEVATOR

	def_bg_events
	bg_event 11,  4, 2 ; CeladonMart1Text2
	bg_event 14,  1, 3 ; CeladonMart1Text3

	def_object_events
	object_event SPRITE_LINK_RECEPTIONIST, 8, 3, STAY, DOWN, 1 ; person

	def_warps_to CELADON_MART_1F
