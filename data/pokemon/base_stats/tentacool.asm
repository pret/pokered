	db DEX_TENTACOOL ; pokedex id

	db  40,  40,  35,  70, 100
	;   hp  atk  def  spd  spc

	db WATER, POISON ; type
	db 190 ; catch rate
	db 105 ; base exp

	INCBIN "gfx/pokemon/front/tentacool.pic", 0, 1 ; sprite dimensions
	dw TentacoolPicFront, TentacoolPicBack

	db ACID, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db 5 ; growth rate

	; tm/hm learnset
	tmhm 3, 6, 9, 10, 11, 12, 13, 14, 20, 21, 31, 32, 33, 34, 40, 44, 50, 51, 53
	; end

	db 0 ; padding
