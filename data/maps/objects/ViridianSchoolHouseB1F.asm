ViridianSchoolHouseB1F_Object:
	db $a ; border block

	def_warp_events
	warp_event  17, 11, VIRIDIAN_SCHOOL_HOUSE, 3

	def_bg_events
	bg_event 1, 8, 13 ; bottom left notebook
	bg_event 3, 8, 14 ; bottom center notebook
	bg_event 1, 4, 15 ; left tutee's notebook
	bg_event 3, 4, 16 ; tutor's notebook
	bg_event 11, 8, 17 ; rocker's notebook
	bg_event 15, 4, 18 ; brunette girl's notebook
	bg_event 11, 4, 19 ; nerd's notebook
	bg_event 13, 8, 20 ; bottom right notebook
	bg_event 3, 0, 21 ; left blackboard
	bg_event 4, 0, 21 ; left blackboard
	bg_event 13, 0, 22 ; right blackboard
	bg_event 5, 10, 23 ; left classroom sign
	bg_event 15,10, 24 ; right classroom sign
	bg_event 7, 0, 25 ; left poster
	bg_event 11,0, 26 ; right poster

	def_object_events
	object_event 15,  9, SPRITE_SILPH_WORKER, STAY, UP, 1 ; person
	object_event 14,  1, SPRITE_GENTLEMAN, STAY, UP, 2 ; person
	object_event 13,  5, SPRITE_LITTLE_GIRL, STAY, UP, 3 ; person
	object_event 11,  5, SPRITE_CLERK, STAY, UP, 4 ; person
	object_event 5,   1, SPRITE_SILPH_PRESIDENT, STAY, DOWN, 5 ; person
	object_event 5,   9, SPRITE_LINK_RECEPTIONIST, STAY, UP, 6 ; person
	object_event 3,   5, SPRITE_DAISY, WALK, LEFT_RIGHT, 7 ; person
	object_event 1,   5, SPRITE_SILPH_WORKER, STAY, UP, 8 ; person
	object_event 5,   5, SPRITE_SILPH_WORKER, STAY, UP, 9 ; person
	object_event 11,  9, SPRITE_ROCKER, STAY, UP, 10 ; person
	object_event 15,  5, SPRITE_BRUNETTE_GIRL, STAY, UP, 11 ; person
	object_event 0,  11, SPRITE_GAMEBOY_KID, STAY, DOWN, 12 ; person

	def_warps_to VIRIDIAN_SCHOOL_HOUSE_B1F


