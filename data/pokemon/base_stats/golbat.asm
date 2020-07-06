	db DEX_GOLBAT ; pokedex id

	db  75,  80,  70,  90,  75
	;   hp  atk  def  spd  spc

	db POISON, FLYING ; type
	db 90 ; catch rate
	db 171 ; base exp

	INCBIN "gfx/pokemon/front/golbat.pic", 0, 1 ; sprite dimensions
	dw GolbatPicFront, GolbatPicBack

	db LEECH_LIFE, SCREECH, BITE, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 2, 4, 6, 9, 10, 15, 20, 21, 31, 32, 34, 39, 44, 50
	; end

	db 0 ; padding
