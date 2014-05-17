Route1Object: ; 0x1c0e5 (size=19)
	db $b ; border block

	db $0 ; warps

	db $1 ; signs
	db $1b, $9, $3 ; Route1Text3

	db $2 ; people
	db SPRITE_BUG_CATCHER, $18 + 4, $5 + 4, $fe, $1, $1 ; person
	db SPRITE_BUG_CATCHER, $d + 4, $f + 4, $fe, $2, $2 ; person

	; warp-to (unused)
	EVENT_DISP $4, $7, $2
