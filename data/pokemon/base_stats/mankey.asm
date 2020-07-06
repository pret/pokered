	db DEX_MANKEY ; pokedex id

	db  40,  80,  35,  70,  35
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db 190 ; catch rate
	db 74 ; base exp

	INCBIN "gfx/pokemon/front/mankey.pic", 0, 1 ; sprite dimensions
	dw MankeyPicFront, MankeyPicBack

	db SCRATCH, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 1, 5, 6, 8, 9, 10, 16, 17, 18, 19, 20, 24, 25, 28, 31, 32, 34, 35, 39, 40, 44, 48, 50, 54
	; end

	db 0 ; padding
