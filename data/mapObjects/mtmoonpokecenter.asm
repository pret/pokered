MtMoonPokecenterObject: ; 0x49376 (size=56)
	db $0 ; border block

	db $2 ; warps
	db $7, $3, $0, $ff
	db $7, $4, $0, $ff

	db $0 ; signs

	db $6 ; people
	db SPRITE_NURSE, $1 + 4, $3 + 4, $ff, $d0, $1 ; person
	db SPRITE_BUG_CATCHER, $3 + 4, $4 + 4, $ff, $d1, $2 ; person
	db SPRITE_GENTLEMAN, $3 + 4, $7 + 4, $ff, $d1, $3 ; person
	db SPRITE_FAT_BALD_GUY, $6 + 4, $a + 4, $fe, $2, $4 ; person
	db SPRITE_CLIPBOARD, $2 + 4, $7 + 4, $ff, $ff, $5 ; person
	db SPRITE_CABLE_CLUB_WOMAN, $2 + 4, $b + 4, $ff, $d0, $6 ; person

	; warp-to
	EVENT_DISP MT_MOON_POKECENTER_WIDTH, $7, $3
	EVENT_DISP MT_MOON_POKECENTER_WIDTH, $7, $4
