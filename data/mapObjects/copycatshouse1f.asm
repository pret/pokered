CopycatsHouse1FObject: ; 0x75ee3 (size=46)
	db $a ; border block

	db $3 ; warps
	db $7, $2, $0, $ff
	db $7, $3, $0, $ff
	db $1, $7, $0, COPYCATS_HOUSE_2F

	db $0 ; signs

	db $3 ; objects
	object SPRITE_MOM_GEISHA, $2, $2, STAY, DOWN, $1 ; person
	object SPRITE_FAT_BALD_GUY, $5, $4, STAY, LEFT, $2 ; person
	object SPRITE_CLEFAIRY, $1, $4, WALK, $1, $3 ; person

	; warp-to
	EVENT_DISP COPYCATS_HOUSE_1F_WIDTH, $7, $2
	EVENT_DISP COPYCATS_HOUSE_1F_WIDTH, $7, $3
	EVENT_DISP COPYCATS_HOUSE_1F_WIDTH, $1, $7 ; COPYCATS_HOUSE_2F
