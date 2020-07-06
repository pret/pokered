	db DEX_GOLDEEN ; pokedex id

	db  45,  67,  60,  63,  50
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 225 ; catch rate
	db 111 ; base exp

	INCBIN "gfx/pokemon/front/goldeen.pic", 0, 1 ; sprite dimensions
	dw GoldeenPicFront, GoldeenPicBack

	db PECK, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 6, 7, 9, 10, 11, 12, 13, 14, 20, 31, 32, 34, 39, 40, 44, 50, 53
	; end

	db 0 ; padding
