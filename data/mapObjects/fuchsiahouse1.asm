FuchsiaHouse1Object:
	db $a ; border block

	db $2 ; warps
	db $7, $2, $1, $ff
	db $7, $3, $1, $ff

	db $0 ; signs

	db $3 ; objects
	object SPRITE_MOM_GEISHA, $2, $3, STAY, RIGHT, $1 ; person
	object SPRITE_GAMBLER, $7, $2, STAY, UP, $2 ; person
	object SPRITE_BUG_CATCHER, $5, $5, STAY, NONE, $3 ; person

	; warp-to
	EVENT_DISP FUCHSIA_HOUSE_1_WIDTH, $7, $2
	EVENT_DISP FUCHSIA_HOUSE_1_WIDTH, $7, $3
