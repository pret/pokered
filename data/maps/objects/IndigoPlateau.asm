IndigoPlateau_Object:
	db $e ; border block

	def_warps
	warp 9, 5, 0, INDIGO_PLATEAU_LOBBY
	warp 10, 5, 0, INDIGO_PLATEAU_LOBBY

	def_signs

	def_objects

	; warp-to
	warp_to 9, 5, INDIGO_PLATEAU_WIDTH ; INDIGO_PLATEAU_LOBBY
	warp_to 10, 5, INDIGO_PLATEAU_WIDTH ; INDIGO_PLATEAU_LOBBY
