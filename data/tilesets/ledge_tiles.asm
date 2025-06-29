LedgeTiles:
	; player direction, tile player standing on, ledge tile, input required
	db SPRITE_FACING_DOWN,  $2C, $37, PAD_DOWN
	db SPRITE_FACING_DOWN,  $39, $36, PAD_DOWN
	db SPRITE_FACING_DOWN,  $39, $37, PAD_DOWN
	db SPRITE_FACING_LEFT,  $2C, $27, PAD_LEFT
	db SPRITE_FACING_LEFT,  $39, $27, PAD_LEFT
	db SPRITE_FACING_RIGHT, $2C, $0D, PAD_RIGHT
	db SPRITE_FACING_RIGHT, $2C, $1D, PAD_RIGHT
	db SPRITE_FACING_RIGHT, $39, $0D, PAD_RIGHT
	db -1 ; end
