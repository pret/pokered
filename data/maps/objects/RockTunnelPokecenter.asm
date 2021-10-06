RockTunnelPokecenter_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 1
	warp_event  4,  7, LAST_MAP, 1

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, 1 ; person
	object_event  7,  3, SPRITE_GENTLEMAN, WALK, LEFT_RIGHT, 2 ; person
	object_event  2,  5, SPRITE_FISHER, STAY, NONE, 3 ; person
	object_event 11,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, 4 ; person

	def_warps_to ROCK_TUNNEL_POKECENTER
