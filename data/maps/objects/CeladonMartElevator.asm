CeladonMartElevator_Object:
	db $f ; border block

	def_warp_events
	warp_event  1,  3, CELADON_MART_1F, 6
	warp_event  2,  3, CELADON_MART_1F, 6

	def_bg_events
	bg_event  3,  0, 1 ; CeladonMartElevatorText1

	def_object_events

	def_warps_to CELADON_MART_ELEVATOR
