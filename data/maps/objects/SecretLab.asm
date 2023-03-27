SecretLab_Object:
	db 1 ; border block

	def_warp_events
	warp_event  4, 43, POKEMON_MANSION_B1F, 2
	warp_event  4, 23, SECRET_LAB, 4
	warp_event  5, 23, SECRET_LAB, 5
	warp_event  4, 16, SECRET_LAB, 2
	warp_event  5, 16, SECRET_LAB, 3

	def_bg_events
	bg_event 2, 6, 4 ; SecretLabMewMachineText

	def_object_events
	object_event  4, 34, SPRITE_SAILOR, STAY, DOWN, 0, OPP_SOLDIER, 5
	object_event  4, 28, SPRITE_SAILOR, STAY, DOWN, 0, OPP_SOLDIER, 6
	object_event  4, 24, SPRITE_CHIEF, STAY, DOWN, 0, OPP_CHIEF, 1 ; chief

	def_warps_to SECRET_LAB
