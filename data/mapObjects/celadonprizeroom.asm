CeladonPrizeRoomObject:
	db $f ; border block

	db $2 ; warps
	db $7, $4, $9, $ff
	db $7, $5, $9, $ff

	db $3 ; signs
	db $2, $2, $3 ; CeladonPrizeRoomText3
	db $2, $4, $4 ; CeladonPrizeRoomText4
	db $2, $6, $5 ; CeladonPrizeRoomText5

	db $2 ; objects
	object SPRITE_BALDING_GUY, $1, $4, STAY, NONE, $1 ; person
	object SPRITE_GAMBLER, $7, $3, WALK, $2, $2 ; person

	; warp-to
	EVENT_DISP CELADON_PRIZE_ROOM_WIDTH, $7, $4
	EVENT_DISP CELADON_PRIZE_ROOM_WIDTH, $7, $5
