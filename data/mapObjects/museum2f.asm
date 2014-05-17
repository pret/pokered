Museum2FObject: ; 0x5c34b (size=48)
	db $a ; border block

	db $1 ; warps
	db $7, $7, $4, MUSEUM_1F

	db $2 ; signs
	db $2, $b, $6 ; Museum2FText6
	db $5, $2, $7 ; Museum2FText7

	db $5 ; people
	db SPRITE_BUG_CATCHER, $7 + 4, $1 + 4, $fe, $2, $1 ; person
	db SPRITE_OLD_PERSON, $5 + 4, $0 + 4, $ff, $d0, $2 ; person
	db SPRITE_OAK_AIDE, $5 + 4, $7 + 4, $ff, $d0, $3 ; person
	db SPRITE_BRUNETTE_GIRL, $5 + 4, $b + 4, $ff, $ff, $4 ; person
	db SPRITE_HIKER, $5 + 4, $c + 4, $ff, $d0, $5 ; person

	; warp-to
	EVENT_DISP MUSEUM_2F_WIDTH, $7, $7 ; MUSEUM_1F
