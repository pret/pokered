CeladonMansion2F_Object:
	db $f ; border block

	def_warp_events
	warp_event  6,  1, 0, CELADON_MANSION_3F
	warp_event  7,  1, 3, CELADON_MANSION_1F
	warp_event  2,  1, 4, CELADON_MANSION_1F
	warp_event  4,  1, 3, CELADON_MANSION_3F

	def_bg_events
	bg_event  4,  9, 1 ; CeladonMansion2Text1

	def_object_events

	def_warps_to CELADON_MANSION_2F
