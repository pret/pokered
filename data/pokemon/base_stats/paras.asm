	db DEX_PARAS ; pokedex id

	db  35,  70,  55,  25,  55
	;   hp  atk  def  spd  spc

	db BUG, GRASS ; type
	db 190 ; catch rate
	db 70 ; base exp

	INCBIN "gfx/pokemon/front/paras.pic", 0, 1 ; sprite dimensions
	dw ParasPicFront, ParasPicBack

	db SCRATCH, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 3, 6, 8, 9, 10, 20, 21, 22, 28, 31, 32, 33, 34, 40, 44, 50, 51
	; end

	db 0 ; padding
