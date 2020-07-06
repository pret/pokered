	db DEX_SEAKING ; pokedex id

	db  80,  92,  65,  68,  80
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 60 ; catch rate
	db 170 ; base exp

	INCBIN "gfx/pokemon/front/seaking.pic", 0, 1 ; sprite dimensions
	dw SeakingPicFront, SeakingPicBack

	db PECK, TAIL_WHIP, SUPERSONIC, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 6, 7, 9, 10, 11, 12, 13, 14, 15, 20, 31, 32, 34, 39, 40, 44, 50, 53
	; end

	db 0 ; padding
