CeladonMartElevator_Object:
	db $f ; border block

	def_warp_events
	warp_event  1,  3, 5, CELADON_MART_1F
	warp_event  2,  3, 5, CELADON_MART_1F

	def_bg_events
	bg_event  3,  0, 1 ; CeladonMartElevatorText1

	def_objects

	def_warps_to CELADON_MART_ELEVATOR
