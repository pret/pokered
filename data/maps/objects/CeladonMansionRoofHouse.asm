	object_const_def
	const_export CELADONMANSION_ROOF_HOUSE_HIKER
	const_export CELADONMANSION_ROOF_HOUSE_EEVEE_POKEBALL

CeladonMansionRoofHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, CELADON_MANSION_ROOF, 3
	warp_event  3,  7, CELADON_MANSION_ROOF, 3

	def_bg_events

	def_object_events
	object_event  2,  2, SPRITE_HIKER, STAY, DOWN, TEXT_CELADONMANSION_ROOF_HOUSE_HIKER
	object_event  4,  3, SPRITE_POKE_BALL, STAY, NONE, TEXT_CELADONMANSION_ROOF_HOUSE_EEVEE_POKEBALL

	def_warps_to CELADON_MANSION_ROOF_HOUSE
