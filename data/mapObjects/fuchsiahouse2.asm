FuchsiaHouse2Object:
	db $17 ; border block

	db $2 ; warps
	db $7, $4, $3, $ff
	db $7, $5, $3, $ff

	db $2 ; signs
	db $3, $4, $4 ; FuchsiaHouse2Text4
	db $3, $5, $5 ; FuchsiaHouse2Text5

	db $3 ; objects
	object SPRITE_WARDEN, $2, $3, STAY, NONE, $1 ; person
	object SPRITE_BALL, $8, $3, STAY, NONE, $2, RARE_CANDY
	object SPRITE_BOULDER, $8, $4, STAY, BOULDER_MOVEMENT_BYTE_2, $3 ; person

	; warp-to
	EVENT_DISP FUCHSIA_HOUSE_2_WIDTH, $7, $4
	EVENT_DISP FUCHSIA_HOUSE_2_WIDTH, $7, $5
