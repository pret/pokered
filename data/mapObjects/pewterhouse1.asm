PewterHouse1Object:
	db $a ; border block

	db $2 ; warps
	db $7, $2, $3, $ff
	db $7, $3, $3, $ff

	db $0 ; signs

	db $3 ; objects
	object SPRITE_SLOWBRO, $4, $5, STAY, LEFT, $1 ; person
	object SPRITE_YOUNG_BOY, $3, $5, STAY, RIGHT, $2 ; person
	object SPRITE_FAT_BALD_GUY, $1, $2, STAY, NONE, $3 ; person

	; warp-to
	EVENT_DISP PEWTER_HOUSE_1_WIDTH, $7, $2
	EVENT_DISP PEWTER_HOUSE_1_WIDTH, $7, $3
