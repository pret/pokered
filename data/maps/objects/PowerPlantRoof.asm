; PureRGBnote: CHANGED: many maps had their objects (items, NPCs, maps) modified for new content

	object_const_def
	const_export POWER_PLANT_ROOF_ZAPDOS

PowerPlantRoof_Object:
	db $09 ; border block

	def_warp_events
	warp_event  2, 3, POWER_PLANT, 10
	warp_event 28, 1, POWER_PLANT, 11

	def_bg_events

	def_object_events
	object_event  15,  9, SPRITE_BIRD2, STAY, DOWN, TEXT_POWER_PLANT_ROOF_ZAPDOS, ZAPDOS, 50

	def_warps_to POWER_PLANT_ROOF
