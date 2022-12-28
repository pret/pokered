SafariZoneGate_Object:
	db $a ; border block

	def_warp_events
	warp_event  3,  5, LAST_MAP, 5
	warp_event  4,  5, LAST_MAP, 5
	warp_event  3,  0, SAFARI_ZONE_CENTER, 1
	warp_event  4,  0, SAFARI_ZONE_CENTER, 2

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_SAFARI_ZONE_WORKER, STAY, LEFT, 1 ; person
	object_event  1,  4, SPRITE_SAFARI_ZONE_WORKER, STAY, RIGHT, 2 ; person

	def_warps_to SAFARI_ZONE_GATE
