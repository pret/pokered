	db DEX_EXEGGUTOR ; pokedex id

	db  95,  95,  85,  55, 125
	;   hp  atk  def  spd  spc

	db GRASS, PSYCHIC ; type
	db 45 ; catch rate
	db 212 ; base exp

	INCBIN "gfx/pokemon/front/exeggutor.pic", 0, 1 ; sprite dimensions
	dw ExeggutorPicFront, ExeggutorPicBack

	db BARRAGE, HYPNOSIS, NO_MOVE, NO_MOVE ; level 1 learnset
	db 5 ; growth rate

	; tm/hm learnset
	tmhm 6, 9, 10, 15, 20, 21, 22, 29, 30, 31, 32, 33, 34, 36, 37, 44, 46, 47, 50, 54
	; end

	db 0 ; padding
