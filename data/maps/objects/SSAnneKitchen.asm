	object_const_def
	const_export SSANNEKITCHEN_COOK1
	const_export SSANNEKITCHEN_COOK2
	const_export SSANNEKITCHEN_COOK3
	const_export SSANNEKITCHEN_COOK4
	const_export SSANNEKITCHEN_COOK5
	const_export SSANNEKITCHEN_COOK6
	const_export SSANNEKITCHEN_COOK7

SSAnneKitchen_Object:
	db $c ; border block

	def_warp_events
	warp_event  6,  0, SS_ANNE_1F, 11

	def_bg_events

	def_object_events
	object_event  1,  8, SPRITE_COOK, WALK, UP_DOWN, TEXT_SSANNEKITCHEN_COOK1
	object_event  5,  8, SPRITE_COOK, WALK, UP_DOWN, TEXT_SSANNEKITCHEN_COOK2
	object_event  9,  7, SPRITE_COOK, WALK, UP_DOWN, TEXT_SSANNEKITCHEN_COOK3
	object_event 13,  6, SPRITE_COOK, STAY, NONE, TEXT_SSANNEKITCHEN_COOK4
	object_event 13,  8, SPRITE_COOK, STAY, NONE, TEXT_SSANNEKITCHEN_COOK5
	object_event 13, 10, SPRITE_COOK, STAY, NONE, TEXT_SSANNEKITCHEN_COOK6
	object_event 11, 13, SPRITE_COOK, STAY, UP, TEXT_SSANNEKITCHEN_COOK7

	def_warps_to SS_ANNE_KITCHEN
