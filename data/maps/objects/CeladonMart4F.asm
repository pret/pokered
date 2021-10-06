CeladonMart4F_Object:
	db $f ; border block

	def_warp_events
	warp_event 12,  1, CELADON_MART_3F, 1
	warp_event 16,  1, CELADON_MART_5F, 2
	warp_event  1,  1, CELADON_MART_ELEVATOR, 1

	def_bg_events
	bg_event 14,  1, 4 ; CeladonMart4Text4

	def_object_events
	object_event  5,  7, SPRITE_CLERK, STAY, NONE, 1 ; person
	object_event 15,  5, SPRITE_SUPER_NERD, WALK, LEFT_RIGHT, 2 ; person
	object_event  5,  2, SPRITE_YOUNGSTER, WALK, LEFT_RIGHT, 3 ; person

	def_warps_to CELADON_MART_4F
