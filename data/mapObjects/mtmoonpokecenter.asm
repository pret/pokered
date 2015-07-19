MtMoonPokecenterObject: ; 0x49376 (size=56)
	db $0 ; border block

	db $2 ; warps
	db $7, $3, $0, $ff
	db $7, $4, $0, $ff

	db $0 ; signs

	db $6 ; objects
	object SPRITE_NURSE, $3, $1, STAY, DOWN, $1 ; person
	object SPRITE_BUG_CATCHER, $4, $3, STAY, UP, $2 ; person
	object SPRITE_GENTLEMAN, $7, $3, STAY, UP, $3 ; person
	object SPRITE_FAT_BALD_GUY, $a, $6, WALK, $2, $4 ; person
	object SPRITE_CLIPBOARD, $7, $2, STAY, NONE, $5 ; person
	object SPRITE_CABLE_CLUB_WOMAN, $b, $2, STAY, DOWN, $6 ; person

	; warp-to
	EVENT_DISP MT_MOON_POKECENTER_WIDTH, $7, $3
	EVENT_DISP MT_MOON_POKECENTER_WIDTH, $7, $4
