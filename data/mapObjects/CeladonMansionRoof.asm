CeladonMansionRoof_Object:
	db $9 ; border block

	db 3 ; warps
	warp 6, 1, 1, CELADON_MANSION_3F
	warp 2, 1, 2, CELADON_MANSION_3F
	warp 2, 7, 0, CELADON_MANSION_ROOF_HOUSE

	db 1 ; signs
	sign 3, 7, 1 ; CeladonMansion4Text1

	db 0 ; objects

	; warp-to
	warp_to 6, 1, CELADON_MANSION_ROOF_WIDTH ; CELADON_MANSION_3F
	warp_to 2, 1, CELADON_MANSION_ROOF_WIDTH ; CELADON_MANSION_3F
	warp_to 2, 7, CELADON_MANSION_ROOF_WIDTH ; CELADON_MANSION_ROOF_HOUSE
