SilphCo5Object:
	db $2e ; border block

	db $7 ; warps
	warp $18, $0, $1, SILPH_CO_6F
	warp $1a, $0, $1, SILPH_CO_4F
	warp $14, $0, $0, SILPH_CO_ELEVATOR
	warp $1b, $3, $5, SILPH_CO_7F
	warp $9, $f, $4, SILPH_CO_9F
	warp $b, $5, $4, SILPH_CO_3F
	warp $3, $f, $5, SILPH_CO_3F

	db $0 ; signs

	db $b ; objects
	object SPRITE_LAPRAS_GIVER, $d, $9, STAY, NONE, $1 ; person
	object SPRITE_ROCKET, $8, $10, STAY, RIGHT, $2, OPP_ROCKET, $1c
	object SPRITE_OAK_AIDE, $8, $3, STAY, RIGHT, $3, OPP_SCIENTIST, $6
	object SPRITE_ROCKER, $12, $a, STAY, UP, $4, OPP_JUGGLER, $1
	object SPRITE_ROCKET, $1c, $4, STAY, UP, $5, OPP_ROCKET, $1d
	object SPRITE_BALL, $2, $d, STAY, NONE, $6, TM_09
	object SPRITE_BALL, $4, $6, STAY, NONE, $7, PROTEIN
	object SPRITE_BALL, $15, $10, STAY, NONE, $8, CARD_KEY
	object SPRITE_CLIPBOARD, $16, $c, STAY, NONE, $9 ; person
	object SPRITE_CLIPBOARD, $19, $a, STAY, NONE, $a ; person
	object SPRITE_CLIPBOARD, $18, $6, STAY, NONE, $b ; person

	; warp-to
	warp_to $18, $0, SILPH_CO_5F_WIDTH ; SILPH_CO_6F
	warp_to $1a, $0, SILPH_CO_5F_WIDTH ; SILPH_CO_4F
	warp_to $14, $0, SILPH_CO_5F_WIDTH ; SILPH_CO_ELEVATOR
	warp_to $1b, $3, SILPH_CO_5F_WIDTH ; SILPH_CO_7F
	warp_to $9, $f, SILPH_CO_5F_WIDTH ; SILPH_CO_9F
	warp_to $b, $5, SILPH_CO_5F_WIDTH ; SILPH_CO_3F
	warp_to $3, $f, SILPH_CO_5F_WIDTH ; SILPH_CO_3F
