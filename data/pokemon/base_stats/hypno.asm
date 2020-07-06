	db DEX_HYPNO ; pokedex id

	db  85,  73,  70,  67, 115
	;   hp  atk  def  spd  spc

	db PSYCHIC, PSYCHIC ; type
	db 75 ; catch rate
	db 165 ; base exp

	INCBIN "gfx/pokemon/front/hypno.pic", 0, 1 ; sprite dimensions
	dw HypnoPicFront, HypnoPicBack

	db POUND, HYPNOSIS, DISABLE, CONFUSION ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 1, 5, 6, 8, 9, 10, 15, 17, 18, 19, 20, 29, 30, 31, 32, 33, 34, 35, 40, 42, 44, 45, 46, 49, 50, 55
	; end

	db 0 ; padding
