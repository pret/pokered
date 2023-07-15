RocketHideoutElevator_Object:
	db $f ; border block

	def_warp_events
	warp_event  2,  1, ROCKET_HIDEOUT_B1F, 3
	warp_event  3,  1, ROCKET_HIDEOUT_B1F, 5

	def_bg_events
	bg_event  1,  1, TEXT_ROCKETHIDEOUTELEVATOR

	def_object_events

	def_warps_to ROCKET_HIDEOUT_ELEVATOR
