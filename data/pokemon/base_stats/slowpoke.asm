	db DEX_SLOWPOKE ; pokedex id

	db  90,  65,  65,  15,  40
	;   hp  atk  def  spd  spc

	db WATER, PSYCHIC ; type
	db 190 ; catch rate
	db 99 ; base exp

	INCBIN "gfx/pokemon/front/slowpoke.pic", 0, 1 ; sprite dimensions
	dw SlowpokePicFront, SlowpokePicBack

	db CONFUSION, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db 0 ; growth rate

	; tm/hm learnset
	tmhm 6, 8, 9, 10, 11, 12, 13, 14, 16, 20, 26, 27, 28, 29, 30, 31, 32, 33, 34, 38, 39, 40, 44, 45, 46, 49, 50, 53, 54, 55
	; end

	db 0 ; padding
