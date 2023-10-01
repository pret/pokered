BillsGarden_Object:
	db $2c ; border block

	def_warp_events
	warp_event  9, 14, BILLS_HOUSE, 3
	warp_event 10, 14, BILLS_HOUSE, 4

	def_bg_events
	bg_event 5, 5, 3 ; sign

	def_object_events
	object_event  9,  3, SPRITE_ERIKA, STAY, UP, 1 ; person
	object_event 10,  3, SPRITE_SABRINA, STAY, UP, 2 ; person
	; TODO: use text constants properly

	def_warps_to BILLS_GARDEN
