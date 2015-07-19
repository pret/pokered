BluesHouseObject: ; 19bce (6:5bce)
	db $0A ; border block

	db $2 ; warps
	db $7, $2, $1, $FF
	db $7, $3, $1, $FF

	db $0 ; signs

	db $3 ; objects
	object SPRITE_DAISY, $2, $3, STAY, RIGHT, $1 ; Daisy, sitting by map
	object SPRITE_DAISY, $6, $4, WALK, $1, $2, $0 ; Daisy, walking around
	object SPRITE_BOOK_MAP_DEX, $3, $3, STAY, NONE, $3, $0 ; map on table

	; warp-to
	EVENT_DISP BLUES_HOUSE_WIDTH, $7, $2
	EVENT_DISP BLUES_HOUSE_WIDTH, $7, $3
