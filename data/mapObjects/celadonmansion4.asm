CeladonMansion4Object:
	db $9 ; border block

	db $3 ; warps
	db $1, $6, $1, CELADON_MANSION_3
	db $1, $2, $2, CELADON_MANSION_3
	db $7, $2, $0, CELADON_MANSION_5

	db $1 ; signs
	db $7, $3, $1 ; CeladonMansion4Text1

	db $0 ; objects

	; warp-to
	EVENT_DISP CELADON_MANSION_4_WIDTH, $1, $6 ; CELADON_MANSION_3
	EVENT_DISP CELADON_MANSION_4_WIDTH, $1, $2 ; CELADON_MANSION_3
	EVENT_DISP CELADON_MANSION_4_WIDTH, $7, $2 ; CELADON_MANSION_5
