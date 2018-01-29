CeladonMansion1Object:
	db $f ; border block

	db $5 ; warps
	warp $4, $b, $2, $ff
	warp $5, $b, $2, $ff
	warp $4, $0, $4, $ff
	warp $7, $1, $1, CELADON_MANSION_2
	warp $2, $1, $2, CELADON_MANSION_2

	db $1 ; signs
	sign $4, $9, $5 ; CeladonMansion1Text5

	db $4 ; objects
	object SPRITE_SLOWBRO, $0, $5, STAY, RIGHT, $1 ; person
	object SPRITE_OLD_MEDIUM_WOMAN, $1, $5, STAY, DOWN, $2 ; person
	object SPRITE_CLEFAIRY, $1, $8, WALK, $2, $3 ; person
	object SPRITE_SLOWBRO, $4, $4, WALK, $1, $4 ; person

	; warp-to
	warp_to $4, $b, CELADON_MANSION_1_WIDTH
	warp_to $5, $b, CELADON_MANSION_1_WIDTH
	warp_to $4, $0, CELADON_MANSION_1_WIDTH
	warp_to $7, $1, CELADON_MANSION_1_WIDTH ; CELADON_MANSION_2
	warp_to $2, $1, CELADON_MANSION_1_WIDTH ; CELADON_MANSION_2
