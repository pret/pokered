	db DEX_TENTACRUEL ; pokedex id

	db  80,  70,  65, 100, 120
	;   hp  atk  def  spd  spc

	db WATER, POISON ; type
	db 60 ; catch rate
	db 205 ; base exp

	INCBIN "gfx/pokemon/front/tentacruel.pic", 0, 1 ; sprite dimensions
	dw TentacruelPicFront, TentacruelPicBack

	db ACID, SUPERSONIC, WRAP, NO_MOVE ; level 1 learnset
	db 5 ; growth rate

	; tm/hm learnset
	tmhm 3, 6, 9, 10, 11, 12, 13, 14, 15, 20, 21, 31, 32, 33, 34, 40, 44, 50, 51, 53
	; end

	db 0 ; padding
