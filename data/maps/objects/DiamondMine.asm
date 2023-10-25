	object_const_def
	const_export DIAMOND_MINE_PROSPECTOR
	const_export DIAMOND_MINE_BOOMBOX

DiamondMine_Object:
	db $03 ; border block

	def_warp_events
	warp_event  3, 19, LAST_MAP, 6
	warp_event  4, 19, LAST_MAP, 6
	warp_event  7,  5, DIAMOND_MINE, 4
	warp_event 18, 17, DIAMOND_MINE, 4
	warp_event 15, 17, DIAMOND_MINE, 6
	warp_event  4, 15, DIAMOND_MINE, 6
	warp_event 19,  5, DIAMOND_MINE, 8
	warp_event  2,  3, DIAMOND_MINE, 8

	def_bg_events

	def_object_events
	object_event 2, 3, SPRITE_SAILOR, STAY, NONE, TEXT_DIAMOND_MINE_PROSPECTOR
	object_event 1, 4, SPRITE_BOOMBOX, STAY, DOWN, TEXT_DIAMOND_MINE_BOOMBOX

	def_warps_to DIAMOND_MINE