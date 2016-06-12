BikeShopObject:
	db $e ; border block

	db $2 ; warps
	db $7, $2, $4, $ff
	db $7, $3, $4, $ff

	db $0 ; signs

	db $3 ; objects
	object SPRITE_BIKE_SHOP_GUY, $6, $2, STAY, NONE, $1 ; person
	object SPRITE_MOM_GEISHA, $5, $6, WALK, $1, $2 ; person
	object SPRITE_BUG_CATCHER, $1, $3, STAY, UP, $3 ; person

	; warp-to
	EVENT_DISP BIKE_SHOP_WIDTH, $7, $2
	EVENT_DISP BIKE_SHOP_WIDTH, $7, $3
