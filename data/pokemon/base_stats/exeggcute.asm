	db DEX_EXEGGCUTE ; pokedex id

	db  60,  40,  80,  40,  60
	;   hp  atk  def  spd  spc

	db GRASS, PSYCHIC ; type
	db 90 ; catch rate
	db 98 ; base exp

	INCBIN "gfx/pokemon/front/exeggcute.pic", 0, 1 ; sprite dimensions
	dw ExeggcutePicFront, ExeggcutePicBack

	db BARRAGE, HYPNOSIS, NO_MOVE, NO_MOVE ; level 1 learnset
	db 5 ; growth rate

	; tm/hm learnset
	tmhm 6, 9, 10, 20, 29, 30, 31, 32, 33, 34, 36, 37, 44, 46, 47, 50
	; end

	db 0 ; padding
