	db DEX_SLOWBRO ; pokedex id

	db  95,  75, 110,  30,  80
	;   hp  atk  def  spd  spc

	db WATER, PSYCHIC ; type
	db 75 ; catch rate
	db 164 ; base exp

	INCBIN "gfx/pokemon/front/slowbro.pic", 0, 1 ; sprite dimensions
	dw SlowbroPicFront, SlowbroPicBack

	db CONFUSION, DISABLE, HEADBUTT, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 1, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 26, 27, 28, 29, 30, 31, 32, 33, 34, 38, 39, 40, 44, 45, 46, 49, 50, 53, 54, 55
	; end

	db 0 ; padding
