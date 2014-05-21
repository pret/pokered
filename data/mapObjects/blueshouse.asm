BluesHouseObject: ; 19bce (6:5bce)
	db $0A ; border block

	db $2 ; warps
	db $7, $2, $1, $FF
	db $7, $3, $1, $FF

	db $0 ; signs

	db $3 ; people
	db SPRITE_DAISY, $3 + 4, $2 + 4, $FF, $D3, $1 ; Daisy, sitting by map
	db SPRITE_DAISY, $4 + 4, $6 + 4, $FE, $1, ITEM | $2, $0 ; Daisy, walking around
	db SPRITE_BOOK_MAP_DEX, $3 + 4, $3 + 4, $FF, $FF, ITEM | $3, $0 ; map on table

	; warp-to
	EVENT_DISP BLUES_HOUSE_WIDTH, $7, $2
	EVENT_DISP BLUES_HOUSE_WIDTH, $7, $3
