CeladonHouseObject: ; 0x49227 (size=38)
	db $f ; border block

	db $2 ; warps
	db $7, $2, $b, $ff
	db $7, $3, $b, $ff

	db $0 ; signs

	db $3 ; people
	db SPRITE_OLD_PERSON, $2 + 4, $4 + 4, $ff, $d0, $1 ; person
	db SPRITE_ROCKET, $4 + 4, $1 + 4, $fe, $0, $2 ; person
	db SPRITE_SAILOR, $6 + 4, $5 + 4, $ff, $d2, $3 ; person

	; warp-to
	EVENT_DISP CELADON_HOUSE_WIDTH, $7, $2
	EVENT_DISP CELADON_HOUSE_WIDTH, $7, $3
