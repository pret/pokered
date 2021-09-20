CeladonMart4F_Object:
	db $f ; border block

	def_warp_events
	warp_event 12,  1, 0, CELADON_MART_3F
	warp_event 16,  1, 1, CELADON_MART_5F
	warp_event  1,  1, 0, CELADON_MART_ELEVATOR

	def_bg_events
	bg_event 14,  1, 4 ; CeladonMart4Text4

	def_objects
	object SPRITE_CLERK, 5, 7, STAY, NONE, 1 ; person
	object SPRITE_SUPER_NERD, 15, 5, WALK, LEFT_RIGHT, 2 ; person
	object SPRITE_YOUNGSTER, 5, 2, WALK, LEFT_RIGHT, 3 ; person

	def_warps_to CELADON_MART_4F
