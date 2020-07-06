	db DEX_ONIX ; pokedex id

	db  35,  45, 160,  70,  30
	;   hp  atk  def  spd  spc

	db ROCK, GROUND ; type
	db 45 ; catch rate
	db 108 ; base exp

	INCBIN "gfx/pokemon/front/onix.pic", 0, 1 ; sprite dimensions
	dw OnixPicFront, OnixPicBack

	db TACKLE, SCREECH, NO_MOVE, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 6, 8, 9, 10, 20, 26, 27, 28, 31, 32, 34, 36, 40, 44, 47, 48, 50, 54
	; end

	db 0 ; padding
