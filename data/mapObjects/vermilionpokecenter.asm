VermilionPokecenterObject: ; 0x5c9a9 (size=44)
	db $0 ; border block

	db $2 ; warps
	db $7, $3, $0, $ff
	db $7, $4, $0, $ff

	db $0 ; signs

	db $4 ; people
	db SPRITE_NURSE, $1 + 4, $3 + 4, $ff, $d0, $1 ; person
	db SPRITE_FISHER, $5 + 4, $a + 4, $ff, $ff, $2 ; person
	db SPRITE_SAILOR, $4 + 4, $5 + 4, $ff, $ff, $3 ; person
	db SPRITE_CABLE_CLUB_WOMAN, $2 + 4, $b + 4, $ff, $d0, $4 ; person

	; warp-to
	EVENT_DISP VERMILION_POKECENTER_WIDTH, $7, $3
	EVENT_DISP VERMILION_POKECENTER_WIDTH, $7, $4
