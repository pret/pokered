CeladonHouseObject:
	db $f ; border block

	db $2 ; warps
	db $7, $2, $b, $ff
	db $7, $3, $b, $ff

	db $0 ; signs

	db $3 ; objects
	object SPRITE_OLD_PERSON, $4, $2, STAY, DOWN, $1 ; person
	object SPRITE_ROCKET, $1, $4, WALK, $0, $2 ; person
	object SPRITE_SAILOR, $5, $6, STAY, LEFT, $3 ; person

	; warp-to
	EVENT_DISP CELADON_HOUSE_WIDTH, $7, $2
	EVENT_DISP CELADON_HOUSE_WIDTH, $7, $3
