LedgeTiles:
	; player direction, tile player standing on, ledge tile, input required
	db SPRITE_FACING_DOWN,  $2C, $37, D_DOWN
	db SPRITE_FACING_DOWN,  $39, $36, D_DOWN
	db SPRITE_FACING_DOWN,  $39, $37, D_DOWN
	db SPRITE_FACING_LEFT,  $2C, $27, D_LEFT
	db SPRITE_FACING_LEFT,  $39, $27, D_LEFT
	db SPRITE_FACING_RIGHT, $2C, $0D, D_RIGHT
	db SPRITE_FACING_RIGHT, $2C, $1D, D_RIGHT
	db SPRITE_FACING_RIGHT, $39, $0D, D_RIGHT
	db -1 ; end

; PureRGBnote: ADDED: in the volcano you can jump over specific new tiles like ledges.
VolcanoLedgeTiles:
	; player direction, ledge tile, input required
	db SPRITE_FACING_DOWN,  $41, D_DOWN
	db SPRITE_FACING_RIGHT,  $40, D_RIGHT
	db SPRITE_FACING_LEFT,  $30, D_LEFT
	db -1
