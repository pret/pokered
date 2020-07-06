	db DEX_GOLEM ; pokedex id

	db  80, 110, 130,  45,  55
	;   hp  atk  def  spd  spc

	db ROCK, GROUND ; type
	db 45 ; catch rate
	db 177 ; base exp

	INCBIN "gfx/pokemon/front/golem.pic", 0, 1 ; sprite dimensions
	dw GolemPicFront, GolemPicBack

	db TACKLE, DEFENSE_CURL, NO_MOVE, NO_MOVE ; level 1 learnset
	db 3 ; growth rate

	; tm/hm learnset
	tmhm 1, 5, 6, 8, 9, 10, 15, 17, 18, 19, 20, 26, 27, 28, 31, 32, 34, 35, 36, 38, 44, 47, 48, 50, 54
	; end

	db 0 ; padding
