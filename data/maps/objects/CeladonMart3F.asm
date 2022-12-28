CeladonMart3F_Object:
	db $f ; border block

	def_warp_events
	warp_event 12,  1, CELADON_MART_4F, 1
	warp_event 16,  1, CELADON_MART_2F, 2
	warp_event  1,  1, CELADON_MART_ELEVATOR, 1

	def_bg_events
	bg_event  2,  4, 6 ; CeladonMart3Text6
	bg_event  3,  4, 7 ; CeladonMart3Text7
	bg_event  5,  4, 8 ; CeladonMart3Text8
	bg_event  6,  4, 9 ; CeladonMart3Text9
	bg_event  2,  6, 10 ; CeladonMart3Text10
	bg_event  3,  6, 11 ; CeladonMart3Text11
	bg_event  5,  6, 12 ; CeladonMart3Text12
	bg_event  6,  6, 13 ; CeladonMart3Text13
	bg_event 14,  1, 14 ; CeladonMart3Text14
	bg_event  4,  1, 15 ; CeladonMart3Text15
	bg_event  6,  1, 16 ; CeladonMart3Text16
	bg_event 10,  1, 17 ; CeladonMart3Text17

	def_object_events
	object_event 16,  5, SPRITE_CLERK, STAY, NONE, 1 ; person
	object_event 11,  6, SPRITE_GAMEBOY_KID, STAY, RIGHT, 2 ; person
	object_event  7,  2, SPRITE_GAMEBOY_KID, STAY, DOWN, 3 ; person
	object_event  8,  2, SPRITE_GAMEBOY_KID, STAY, DOWN, 4 ; person
	object_event  2,  5, SPRITE_LITTLE_BOY, STAY, UP, 5 ; person

	def_warps_to CELADON_MART_3F
