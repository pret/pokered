; PureRGBnote: CHANGED: many maps had their objects (items, NPCs, maps) modified for new content

	object_const_def
	const TYPE_GUYS_HOUSE_TYPE_GUY

TypeGuysHouse_Object:
	db $0F ; border block

	def_warp_events
	warp_event  0,  7, ROUTE_23, 5
	warp_event  1,  7, ROUTE_23, 5
	warp_event  0,  3, TYPE_GUYS_HOUSE, 4
	warp_event 13,  1, TYPE_GUYS_HOUSE, 3

	def_bg_events
	bg_event 11, 1, TEXT_TYPE_GUYS_HOUSE_SHORT_BOOKCASE
	bg_event 10, 1, TEXT_TYPE_GUYS_HOUSE_SCULPTURE
	bg_event  9, 1, TEXT_TYPE_GUYS_HOUSE_RIGHT_TALL_BOOKCASE
	bg_event  8, 1, TEXT_TYPE_GUYS_HOUSE_LEFT_TALL_BOOKCASE

	def_object_events
	object_event  8,  6, SPRITE_GAMBLER_ASLEEP, STAY, NONE, TEXT_TYPE_GUYS_HOUSE_TYPE_GUY

	def_warps_to TYPE_GUYS_HOUSE
