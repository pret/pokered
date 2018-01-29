CeladonMansion4Object:
	db 9 ; border block

	db 3 ; warps
	warp 6, 1, 1, CELADON_MANSION_3
	warp 2, 1, 2, CELADON_MANSION_3
	warp 2, 7, 0, CELADON_MANSION_5

	db 1 ; signs
	sign 3, 7, 1 ; CeladonMansion4Text1

	db 0 ; objects

	; warp-to
	warp_to 6, 1, CELADON_MANSION_4_WIDTH ; CELADON_MANSION_3
	warp_to 2, 1, CELADON_MANSION_4_WIDTH ; CELADON_MANSION_3
	warp_to 2, 7, CELADON_MANSION_4_WIDTH ; CELADON_MANSION_5
