PewterPokecenterObject: ; 0x5c60d (size=44)
	db $0 ; border block

	db $2 ; warps
	db $7, $3, $6, $ff
	db $7, $4, $6, $ff

	db $0 ; signs

	db $4 ; people
	db SPRITE_NURSE, $1 + 4, $3 + 4, $ff, $d0, $1 ; person
	db SPRITE_GENTLEMAN, $7 + 4, $b + 4, $ff, $d2, $2 ; person
	db SPRITE_CLEFAIRY, $3 + 4, $1 + 4, $ff, $d0, $3 ; person
	db SPRITE_CABLE_CLUB_WOMAN, $2 + 4, $b + 4, $ff, $d0, $4 ; person

	; warp-to
	EVENT_DISP PEWTER_POKECENTER_WIDTH, $7, $3
	EVENT_DISP PEWTER_POKECENTER_WIDTH, $7, $4
