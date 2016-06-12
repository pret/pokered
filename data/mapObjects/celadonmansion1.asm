CeladonMansion1Object:
	db $f ; border block

	db $5 ; warps
	db $b, $4, $2, $ff
	db $b, $5, $2, $ff
	db $0, $4, $4, $ff
	db $1, $7, $1, CELADON_MANSION_2
	db $1, $2, $2, CELADON_MANSION_2

	db $1 ; signs
	db $9, $4, $5 ; CeladonMansion1Text5

	db $4 ; objects
	object SPRITE_SLOWBRO, $0, $5, STAY, RIGHT, $1 ; person
	object SPRITE_OLD_MEDIUM_WOMAN, $1, $5, STAY, DOWN, $2 ; person
	object SPRITE_CLEFAIRY, $1, $8, WALK, $2, $3 ; person
	object SPRITE_SLOWBRO, $4, $4, WALK, $1, $4 ; person

	; warp-to
	EVENT_DISP CELADON_MANSION_1_WIDTH, $b, $4
	EVENT_DISP CELADON_MANSION_1_WIDTH, $b, $5
	EVENT_DISP CELADON_MANSION_1_WIDTH, $0, $4
	EVENT_DISP CELADON_MANSION_1_WIDTH, $1, $7 ; CELADON_MANSION_2
	EVENT_DISP CELADON_MANSION_1_WIDTH, $1, $2 ; CELADON_MANSION_2
