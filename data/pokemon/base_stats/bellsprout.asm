	db DEX_BELLSPROUT ; pokedex id

	db  50,  75,  35,  40,  70
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db 255 ; catch rate
	db 84 ; base exp

	INCBIN "gfx/pokemon/front/bellsprout.pic", 0, 1 ; sprite dimensions
	dw BellsproutPicFront, BellsproutPicBack

	db VINE_WHIP, GROWTH, NO_MOVE, NO_MOVE ; level 1 learnset
	db 3 ; growth rate

	; tm/hm learnset
	tmhm 3, 6, 9, 10, 20, 21, 22, 31, 32, 33, 34, 44, 50, 51
	; end

	db 0 ; padding
