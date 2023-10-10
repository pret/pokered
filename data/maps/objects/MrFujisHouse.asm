	object_const_def
	const_export MRFUJISHOUSE_SUPER_NERD
	const_export MRFUJISHOUSE_LITTLE_GIRL
	const_export MRFUJISHOUSE_PSYDUCK
	const_export MRFUJISHOUSE_NIDORINO
	const_export MRFUJISHOUSE_MR_FUJI
	const_export MRFUJISHOUSE_POKEDEX

MrFujisHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 3
	warp_event  3,  7, LAST_MAP, 3

	def_bg_events

	def_object_events
	object_event  3,  5, SPRITE_SUPER_NERD, STAY, NONE, TEXT_MRFUJISHOUSE_SUPER_NERD
	object_event  6,  3, SPRITE_LITTLE_GIRL, STAY, DOWN, TEXT_MRFUJISHOUSE_LITTLE_GIRL
	object_event  6,  4, SPRITE_MONSTER, STAY, UP, TEXT_MRFUJISHOUSE_PSYDUCK
	object_event  1,  3, SPRITE_MONSTER, STAY, NONE, TEXT_MRFUJISHOUSE_NIDORINO
	object_event  3,  1, SPRITE_MR_FUJI, STAY, NONE, TEXT_MRFUJISHOUSE_MR_FUJI
	object_event  3,  3, SPRITE_POKEDEX, STAY, NONE, TEXT_MRFUJISHOUSE_POKEDEX

	def_warps_to MR_FUJIS_HOUSE
