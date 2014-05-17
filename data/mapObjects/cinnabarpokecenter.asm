CinnabarPokecenterObject: ; 0x75e46 (size=44)
	db $0 ; border block

	db $2 ; warps
	db $7, $3, $3, $ff
	db $7, $4, $3, $ff

	db $0 ; signs

	db $4 ; people
	db SPRITE_NURSE, $1 + 4, $3 + 4, $ff, $d0, $1 ; person
	db SPRITE_LASS, $4 + 4, $9 + 4, $fe, $0, $2 ; person
	db SPRITE_GENTLEMAN, $6 + 4, $2 + 4, $ff, $ff, $3 ; person
	db SPRITE_CABLE_CLUB_WOMAN, $2 + 4, $b + 4, $ff, $d0, $4 ; person

	; warp-to
	EVENT_DISP CINNABAR_POKECENTER_WIDTH, $7, $3
	EVENT_DISP CINNABAR_POKECENTER_WIDTH, $7, $4
