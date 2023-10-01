	object_const_def
	const CHAMP_ARENA_PROXY_PLAYER
	const CHAMP_ARENA_CHALLENGER
	const CHAMP_ARENA_ASSISTANT
	const CHAMP_ARENA_TM_KID
	const CHAMP_ARENA_CROWD1
	const CHAMP_ARENA_CROWD2
	const CHAMP_ARENA_VARIABLE_CROWD1
	const CHAMP_ARENA_VARIABLE_CROWD2
	const CHAMP_ARENA_CROWD3
	const CHAMP_ARENA_VARIABLE_CROWD3
	const CHAMP_ARENA_CROWD4

ChampArena_Object:
	db $1D ; border block

	def_warp_events
	warp_event  7, 17, INDIGO_PLATEAU_LOBBY, 4

	def_bg_events

	def_object_events
	object_event  8,  8, SPRITE_RED, STAY, LEFT, 1 ; proxy player sprite
	object_event  7, 13, SPRITE_ERIKA, STAY, UP, 2
	object_event  8,  5, SPRITE_ARENA_ASSISTANT, STAY, DOWN, TEXT_CHAMP_ARENA_ASSISTANT
	; tm kid
	object_event  6,  8, SPRITE_LITTLE_BOY, STAY, DOWN, 4
	object_event 12, 10, SPRITE_SUPER_NERD_SITTING, STAY, DOWN, 5 ; set crowd 1 (male 1)
	object_event 12,  9, SPRITE_BRUNETTE_GIRL_SITTING, STAY, DOWN, 6 ; set crowd 2 (female 1)
	object_event 12,  8, SPRITE_MIDDLE_AGED_MAN_SITTING, STAY, DOWN, 7 ; variable crowd 1
	object_event 12,  7, SPRITE_MIDDLE_AGED_WOMAN_SITTING, STAY, DOWN, 8 ; variable crowd 2
	object_event 12,  6, SPRITE_SUPER_NERD_SITTING, STAY, DOWN, 9 ; set crowd 3 (male 2)
	object_event 12,  5, SPRITE_COOLTRAINER_F_SITTING, STAY, DOWN, 10 ; variable crowd 3
	object_event 12,  4, SPRITE_SUPER_NERD_SITTING, STAY, DOWN, 11 ; set crowd 4 (male 3)

	def_warps_to CHAMP_ARENA
