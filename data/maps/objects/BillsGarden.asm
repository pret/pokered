	object_const_def
	const_export BILLS_GARDEN_VARIABLE_GUEST1
	const_export BILLS_GARDEN_VARIABLE_GUEST2

BillsGarden_Object:
	db $2c ; border block

	def_warp_events
	warp_event  9, 14, BILLS_HOUSE, 3
	warp_event 10, 14, BILLS_HOUSE, 4

	def_bg_events
	bg_event 5, 5, TEXT_BILLS_GARDEN_SIGN

	def_object_events
	object_event  9,  3, SPRITE_ERIKA, STAY, UP, TEXT_BILLS_GARDEN_VARIABLE_GUEST1
	object_event 10,  3, SPRITE_SABRINA, STAY, UP, TEXT_BILLS_GARDEN_VARIABLE_GUEST2

	def_warps_to BILLS_GARDEN
