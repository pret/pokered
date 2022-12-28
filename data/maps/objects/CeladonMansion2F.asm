CeladonMansion2F_Object:
	db $f ; border block

	def_warp_events
	warp_event  6,  1, CELADON_MANSION_3F, 1
	warp_event  7,  1, CELADON_MANSION_1F, 4
	warp_event  2,  1, CELADON_MANSION_1F, 5
	warp_event  4,  1, CELADON_MANSION_3F, 4

	def_bg_events
	bg_event  4,  9, 1 ; CeladonMansion2Text1

	def_object_events

	def_warps_to CELADON_MANSION_2F
