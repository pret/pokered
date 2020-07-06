	db DEX_WARTORTLE ; pokedex id

	db  59,  63,  80,  58,  65
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 45 ; catch rate
	db 143 ; base exp

	INCBIN "gfx/pokemon/front/wartortle.pic", 0, 1 ; sprite dimensions
	dw WartortlePicFront, WartortlePicBack

	db TACKLE, TAIL_WHIP, BUBBLE, NO_MOVE ; level 1 learnset
	db 3 ; growth rate

	; tm/hm learnset
	tmhm 1, 5, 6, 8, 9, 10, 11, 12, 13, 14, 17, 18, 19, 20, 28, 31, 32, 33, 34, 40, 44, 50, 53, 54
	; end

	db 0 ; padding
