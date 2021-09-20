RocketHideoutElevator_Object:
	db $f ; border block

	def_warp_events
	warp_event  2,  1, 2, ROCKET_HIDEOUT_B1F
	warp_event  3,  1, 4, ROCKET_HIDEOUT_B1F

	def_bg_events
	bg_event  1,  1, 1 ; RocketHideoutElevatorText1

	def_objects

	def_warps_to ROCKET_HIDEOUT_ELEVATOR
