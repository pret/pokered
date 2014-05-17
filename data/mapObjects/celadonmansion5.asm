CeladonMansion5Object: ; 0x1dd5c (size=32)
	db $a ; border block

	db $2 ; warps
	db $7, $2, $2, CELADON_MANSION_4
	db $7, $3, $2, CELADON_MANSION_4

	db $0 ; signs

	db $2 ; people
	db SPRITE_HIKER, $2 + 4, $2 + 4, $ff, $d0, $1 ; person
	db SPRITE_BALL, $3 + 4, $4 + 4, $ff, $ff, $2 ; person

	; warp-to
	EVENT_DISP CELADON_MANSION_5_WIDTH, $7, $2 ; CELADON_MANSION_4
	EVENT_DISP CELADON_MANSION_5_WIDTH, $7, $3 ; CELADON_MANSION_4
