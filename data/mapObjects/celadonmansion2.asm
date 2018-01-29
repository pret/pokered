CeladonMansion2Object:
	db $f ; border block

	db $4 ; warps
	warp $6, $1, $0, CELADON_MANSION_3
	warp $7, $1, $3, CELADON_MANSION_1
	warp $2, $1, $4, CELADON_MANSION_1
	warp $4, $1, $3, CELADON_MANSION_3

	db $1 ; signs
	sign $4, $9, $1 ; CeladonMansion2Text1

	db $0 ; objects

	; warp-to
	warp_to $6, $1, CELADON_MANSION_2_WIDTH ; CELADON_MANSION_3
	warp_to $7, $1, CELADON_MANSION_2_WIDTH ; CELADON_MANSION_1
	warp_to $2, $1, CELADON_MANSION_2_WIDTH ; CELADON_MANSION_1
	warp_to $4, $1, CELADON_MANSION_2_WIDTH ; CELADON_MANSION_3
