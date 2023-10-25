	object_const_def
	const_export FUCHSIATREEDELETERHOUSE_TREE_DELETER
	const_export FUCHSIATREEDELETERHOUSE_SNORLAX

FuchsiaTreeDeleterHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 10
	warp_event  3,  7, LAST_MAP, 10

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_BIKE_SHOP_CLERK, STAY, RIGHT, TEXT_FUCHSIATREEDELETERHOUSE_TREE_DELETER
	object_event  5,  2, SPRITE_SNORLAX, STAY, NONE, TEXT_FUCHSIATREEDELETERHOUSE_SNORLAX

	def_warps_to FUCHSIA_TREE_DELETER_HOUSE
