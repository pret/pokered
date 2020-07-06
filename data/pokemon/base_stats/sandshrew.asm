	db DEX_SANDSHREW ; pokedex id

	db  50,  75,  85,  40,  30
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db 255 ; catch rate
	db 93 ; base exp

	INCBIN "gfx/pokemon/front/sandshrew.pic", 0, 1 ; sprite dimensions
	dw SandshrewPicFront, SandshrewPicBack

	db SCRATCH, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 3, 6, 8, 9, 10, 17, 19, 20, 26, 27, 28, 31, 32, 34, 39, 40, 44, 48, 50, 51, 54
	; end

	db 0 ; padding
