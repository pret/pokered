ViridianHouseObject: ; 0x1d5bb (size=44)
	db $a ; border block

	db $2 ; warps
	db $7, $2, $3, $ff
	db $7, $3, $3, $ff

	db $0 ; signs

	db $4 ; objects
	object SPRITE_BALDING_GUY, $5, $3, FACE, STAY, $1 ; person
	object SPRITE_LITTLE_GIRL, $1, $4, WALK, $1, $2 ; person
	object SPRITE_BIRD, $5, $5, WALK, $2, $3 ; person
	object SPRITE_CLIPBOARD, $4, $0, FACE, STAY, $4 ; person

	; warp-to
	EVENT_DISP VIRIDIAN_HOUSE_WIDTH, $7, $2
	EVENT_DISP VIRIDIAN_HOUSE_WIDTH, $7, $3
