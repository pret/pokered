CeladonMansion2F_Object:
	db $f ; border block

	db 4 ; warps
	warp 6, 1, 0, CELADON_MANSION_3F
	warp 7, 1, 3, CELADON_MANSION_1F
	warp 2, 1, 4, CELADON_MANSION_1F
	warp 4, 1, 3, CELADON_MANSION_3F

	db 1 ; signs
	sign 4, 9, 1 ; CeladonMansion2Text1

	db 0 ; objects

	; warp-to
	warp_to 6, 1, CELADON_MANSION_2F_WIDTH ; CELADON_MANSION_3F
	warp_to 7, 1, CELADON_MANSION_2F_WIDTH ; CELADON_MANSION_1F
	warp_to 2, 1, CELADON_MANSION_2F_WIDTH ; CELADON_MANSION_1F
	warp_to 4, 1, CELADON_MANSION_2F_WIDTH ; CELADON_MANSION_3F
